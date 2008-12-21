require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class AssertionHelpersTest < ActiveSupport::TestCase
  test "assert_not_tainted should succeed if not tainted" do
    assert_not_tainted "foo"
  end

  test "assert_not_tainted should fail if tainted" do
    assert_raise Test::Unit::AssertionFailedError do
      assert_not_tainted "foo".taint
    end
  end

  test "assert_tainted should succeed if tainted" do
    assert_tainted "foo".taint
  end

  test "assert_tainted should fail if untainted" do
    assert_raise Test::Unit::AssertionFailedError do
      assert_tainted "foo"
    end
  end
end
