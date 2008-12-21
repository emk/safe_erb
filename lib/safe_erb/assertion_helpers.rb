module SafeErb
  module AssertionHelpers
    # Assert that +value+ is not tainted.
    def assert_not_tainted value
      assert !value.tainted?, "#{value.inspect} should not be tainted"
    end

    # Assert that +value+ is tainted.
    def assert_tainted value
      assert value.tainted?, "#{value.inspect} should be tainted"
    end
  end
end
