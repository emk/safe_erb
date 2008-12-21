require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class I18nTest < ActiveSupport::TestCase
  test "translations should not be tainted" do
    # Actually, translations _should_ be tainted by default, but doing so
    # will cause buggy code in ActionView::Helpers to break.  See the
    # source for details.
    translation = I18n.t("messages.blank", :scope => [:activerecord, :errors])
    assert_not_tainted translation
  end
end
