# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{safe_erb}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shinya Kasatani", "Matthew Bass", "Eric Kidd"]
  s.date = %q{2008-12-20}
  s.email = %q{git@randomhacks.net}
  s.files = ["lib/safe_erb/action_view_extensions.rb", "lib/safe_erb/common.rb", "lib/safe_erb/erb_extensions.rb", "lib/safe_erb/rails_1.rb", "lib/safe_erb/rails_2.rb", "lib/safe_erb/sqlite3_fix.rb", "lib/safe_erb/tag_helper.rb", "lib/safe_erb.rb", "rails/init.rb", "test/safe_erb_test.rb", "test/tag_helper_test.rb", "test/test_helper.rb", "MIT-LICENSE", "Rakefile", "README"]
  s.homepage = %q{http://github.com/emk/safe_erb/tree/master}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{safe_erb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Automatically detect improperty-escaped text in ERB templates}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
