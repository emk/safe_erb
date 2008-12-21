require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class ActionViewHelpersTest < ActiveSupport::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::ActiveRecordHelper

  def setup
    @locals = {}
  end

  # Allow test methods to easily set up fake local bindings for use by
  # ActionView helpers.
  def method_missing name, *args
    if @locals.has_key?(name)
      @locals[name]
    else
      super
    end
  end

  test "escape_once should untaint" do
    evil_str = "evil knievel".taint
    assert_not_tainted escape_once(evil_str)
    assert_tainted escape_once_without_untaint(evil_str)
  end

  Post = Struct.new(:published_at)

  test "datetime_select should not be tainted" do
    @locals[:post] = Post.new(Time.now.taint)
    assert_not_tainted datetime_select(:post, :published_at)
  end

  test "error_messages_for should not be tainted" do
    @note = Note.create(:title => "".taint, :text => "Hi".taint)
    assert !@note.valid?, "#{@note} should not validate"
    assert_not_tainted error_messages_for(:object => @note)
  end
end
