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
end
  
