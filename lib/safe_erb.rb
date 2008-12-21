# SafeERB

require 'safe_erb/common'
require 'safe_erb/taint_helpers'
require 'safe_erb/assertion_helpers'
require 'safe_erb/erb_extensions'
require 'safe_erb/i18n_extensions'
require 'safe_erb/action_controller_extensions'
require 'safe_erb/action_view_extensions'
require 'safe_erb/action_view_helpers_extensions'

# Load any database-specific monkey-patches that we need.
begin
  adapter =
    if defined?(SAFE_ERB_TEST_ADAPTER)
      SAFE_ERB_TEST_ADAPTER
    else
      ActiveRecord::Base.configurations[Rails.env]['adapter']
    end
  file = File.join(File.dirname(__FILE__), 'safe_erb', "#{adapter}_fix.rb")
  if File.exists?(file)
    ActiveRecord::Base.connection # Make sure our adapter classes are loaded.
    require "safe_erb/#{adapter}_fix"
  end
end
