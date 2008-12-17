# SafeERB

require 'safe_erb/common'
require 'safe_erb/tag_helper'
require 'safe_erb/erb_extensions'
require 'safe_erb/action_view_extensions'

if Rails::VERSION::MAJOR >= 2
  require 'safe_erb/rails_2'
else
  require 'safe_erb/rails_1'
end

if ActiveRecord::Base.connection.instance_of?(ActiveRecord::ConnectionAdapters::SQLite3Adapter)
  require 'safe_erb/sqlite3_fix'
end
