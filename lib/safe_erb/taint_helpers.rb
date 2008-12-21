module SafeErb
  # Various helpers which allow you to declare your tainted-data policies
  # for use with SafeErb.  To use:
  #
  #   class MyClass
  #     extend SafeErb::TaintHelpers
  #
  #     def remove_html_tags val
  #       # Return val with HTML tags removed.
  #     end
  #     untaint_result :remove_html_tags
  #   end
  module TaintHelpers

    # Automatically untaint the result of +function_name+.
    def untaint_result function_name
      alias_method :"#{function_name}_without_untaint", function_name
      # Do this the hard way to avoid define_method overhead.
      self.class_eval <<"EOD"
def #{function_name}(*args, &block)
  #{function_name}_without_untaint(*args, &block).untaint
end
EOD
    end

  end
end
