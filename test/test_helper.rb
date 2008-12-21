RAILS_ENV = 'test'

require 'rubygems'
require 'active_record'
require File.join(File.dirname(__FILE__), 'database_helper')
require 'safe_erb'
require 'test/unit'
require 'active_support/test_case'

ActiveSupport::TestCase.class_eval do
  include SafeErb::AssertionHelpers
end

