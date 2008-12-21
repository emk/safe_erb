require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TaintHelpersTest < ActiveSupport::TestCase
  extend SafeErb::TaintHelpers

  def my_untaint arg
    arg
  end
  untaint_result :my_untaint

  test "untaint_result should untaint the result of an instance function" do
    assert_not_tainted my_untaint("foo".taint)
  end
end
