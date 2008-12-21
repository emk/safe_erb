require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class SafeERBTest < ActiveSupport::TestCase
  def use_template file
    path = File.join(File.dirname(__FILE__), file)
    @template = ActionView::Template.new(path)
    @view = ActionView::Base.new
  end

  test "should not complain about untainted interpolations" do
    use_template 'safe_erb_template.html.erb'
    assert_equal "foo\n", @template.render_template(@view, :var => 'foo')
  end

  test "should protect html templates" do
    use_template 'safe_erb_template.html.erb'
    assert_raise ActionView::TemplateError do
      @template.render_template(@view, :var => 'foo'.taint)
    end
  end

  test "should not protect text plain templates" do
    # This makes some ActionMailer templates work out of the box.
    use_template 'safe_erb_template.text.plain.erb'
    assert_equal "foo\n", @template.render_template(@view, :var => 'foo'.taint)
  end
end
