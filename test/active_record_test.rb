require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class DatabaseTest < Test::Unit::TestCase
  def setup
    @note = Note.create!(:title => "Hello!", :text => "Welcome.")
    @note.reload
  end

  def test_records_from_database_should_be_tainted
    [:title, :text].each do |a|
      assert @note.send(a).tainted?, "#{a} should be tainted"
    end
  end

  def test_error_messages_should_not_be_tainted
    @note = Note.create(:title => "".taint, :text => "Hi".taint)
    assert !@note.valid?, "#{@note} should not validate"
    assert !@note.errors.tainted?
    @note.errors.full_messages.each do |msg|
      assert !msg.tainted?, "<#{msg}> is tainted"
    end
  end
end
  
