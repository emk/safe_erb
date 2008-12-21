module ActionView
  module Helpers
    module SanitizeHelper
      extend SafeErb::TaintHelpers
      untaint_result :strip_tags
    end

    module TagHelper
      extend SafeErb::TaintHelpers
      untaint_result :escape_once
    end
  end
end
