# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{http_require}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vitaly Kushner"]
  s.date = %q{2009-05-12}
  s.email = %q{vitaly@astrails.com}
  s.extra_rdoc_files = ["README.markdown", "LICENSE"]
  s.files = ["README.markdown", "VERSION.yml", "lib/http_require.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/astrails/http_require}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{allows you to require "http://foo/bar.rb"}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
