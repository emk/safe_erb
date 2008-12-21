# Set up a test database.
DB = {
  :adapter => "sqlite3",
  :database => File.join(File.dirname(__FILE__), 'test.sqlite3')
}
SAFE_ERB_TEST_ADAPTER = DB[:adapter]
File.delete(DB[:database]) if File.exists?(DB[:database])
connection = ActiveRecord::Base.establish_connection(DB)

# Define a table in our database.
ActiveRecord::Schema.define do
  create_table "notes", :force => true do |t|
    t.column "title",  :text
    t.column "text", :text
    t.timestamps
  end
end

# Define a model class.
class Note < ActiveRecord::Base
  validates_presence_of :title
end
