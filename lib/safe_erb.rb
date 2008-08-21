# SafeERB

require 'safe_erb/common'
require 'safe_erb/tag_helper'
require 'safe_erb/erb_extensions'

if Rails::VERSION::MAJOR >= 2
  require 'safe_erb/rails_2'
else
  require 'safe_erb/rails_1'
end
