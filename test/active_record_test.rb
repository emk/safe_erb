require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class DatabaseTest < ActiveSupport::TestCase
  def setup
    @note = Note.create!(:title => "Hello!", :text => "Welcome.")
    @note.reload
  end

  test "records from database should be tainted" do
    [:title, :text].each {|a| assert_tainted @note.send(a) }
  end

  test "error messages should not be tainted" do
    @note = Note.create(:title => "".taint, :text => "Hi".taint)
    assert !@note.valid?, "#{@note} should not validate"
    assert_not_tainted @note.errors
    @note.errors.full_messages.each {|msg| assert_not_tainted msg }
  end
end
  
