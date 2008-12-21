require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class I18nTest < Test::Unit::TestCase
  def test_translations_should_not_be_tainted
    # Actually, translations _should_ be tainted by default, but doing so
    # will cause buggy code in ActionView::Helpers to break.  See the
    # source for details.
    translation = I18n.t("messages.blank", :scope => [:activerecord, :errors])
    assert !translation.tainted?, "<#{translation}> tainted"
  end
end
