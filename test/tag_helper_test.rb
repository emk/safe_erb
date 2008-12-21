require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TagHelperTest < Test::Unit::TestCase
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

  def test_inclusion_in_taghelper
    assert self.respond_to?(:escape_once_with_untaint)
    assert self.respond_to?(:escape_once_without_untaint)
  end

  def test_taghelper_untaints
    evil_str = "evil knievel".taint
    assert !escape_once(evil_str).tainted?
    assert escape_once_without_untaint(evil_str).tainted?
  end

  Post = Struct.new(:published_at)

  def test_datetime_select_should_not_be_tainted
    @locals[:post] = Post.new(Time.now.taint)
    assert !datetime_select(:post, :published_at).tainted?
  end

  def test_error_messages_for_should_not_be_tainted
    @note = Note.create(:title => "".taint, :text => "Hi".taint)
    assert !@note.valid?, "#{@note} should not validate"
    assert !error_messages_for(:object => @note).tainted?
  end
end
