# SafeERB

require 'erb'
require 'action_controller'
require 'action_view'

# TODO - RAILS_ROOT is improperly escaped in the standard error template
# that you see in development mode.  We need to fix this in Edge Rails
# if it hasn't been fixed already.  Since it isn't under the control of
# remote users, we're just going to go ahead and untaint it for now.
RAILS_ROOT.untaint if defined?(RAILS_ROOT)

class String
  def concat_unless_tainted(str)
    raise "attempted to output tainted string: #{str}" if str.is_a?(String) && str.tainted?
    concat(str)
  end
end
