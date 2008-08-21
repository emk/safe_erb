class ERB
  cattr_accessor :check_tainted
  alias_method :original_set_eoutvar, :set_eoutvar
  
  def self.with_checking_tainted(&block)
    # not thread safe
    ERB.check_tainted = true
    begin
      yield
    ensure
      ERB.check_tainted = false
    end
  end
  
  def set_eoutvar(compiler, eoutvar = '_erbout')
    original_set_eoutvar(compiler, eoutvar)
    if check_tainted
      if compiler.respond_to?(:insert_cmd)
        compiler.insert_cmd = "#{eoutvar}.concat_unless_tainted"
      else
        compiler.put_cmd = "#{eoutvar}.concat_unless_tainted"
      end
    end
  end
  
  module Util
    alias_method :html_escape_without_untaint, :html_escape
    
    def html_escape(s)
      h = html_escape_without_untaint(s)
      h.untaint
      h
    end
    
    alias_method :h, :html_escape
    
    module_function :h
    module_function :html_escape
    module_function :html_escape_without_untaint
  end
end
