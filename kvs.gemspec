# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{kvs}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jugyo"]
  s.date = %q{2009-09-15}
  s.description = %q{KVS is a simple key value store.}
  s.email = %q{jugyo.org@gmail.com}
  s.files = ["Rakefile", "README.markdown", "ChangeLog", "lib/kvs.rb", "spec/kvs_spec.rb"]
  s.homepage = %q{http://github.com/jugyo/kvs}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{kvs}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{simple key value store.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
