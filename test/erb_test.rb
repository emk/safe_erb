require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class ErbTest < ActiveSupport::TestCase
  include ERB::Util

  test "h shound untaint" do
    assert_not_tainted h("foo".taint)
    assert_not_tainted ERB::Util.h("foo".taint)
  end

  test "html_escape should untaint" do
    assert_not_tainted html_escape("foo".taint)
    assert_not_tainted ERB::Util.html_escape("foo".taint)
  end


end
