require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class DatabaseTest < ActiveSupport::TestCase
  def setup
    @note = Note.create!(:title => "Hello!", :text => "Welcome.")
    @note.reload
  end

  test "records from database should be tainted" do
    [:title, :text].each do |a|
      assert @note.send(a).tainted?, "#{a} should be tainted"
    end
  end

  test "error messages should not be tainted" do
    @note = Note.create(:title => "".taint, :text => "Hi".taint)
    assert !@note.valid?, "#{@note} should not validate"
    assert !@note.errors.tainted?
    @note.errors.full_messages.each do |msg|
      assert !msg.tainted?, "<#{msg}> is tainted"
    end
  end
end
  
