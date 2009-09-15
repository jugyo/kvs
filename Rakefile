$:.unshift File.dirname(__FILE__) + '/lib'
require 'rubygems'
require 'kvs'
require 'spec/rake/spectask'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'

name = 'kvs'
version = KVS::VERSION

spec = Gem::Specification.new do |s|
  s.name = name
  s.version = version
  s.summary = "simple key value store."
  s.description = "KVS is a simple key value store."
  s.files = %w(Rakefile README.markdown ChangeLog) + Dir.glob("{lib,spec}/**/*.rb")
  s.authors = %w(jugyo)
  s.email = 'jugyo.org@gmail.com'
  s.homepage = 'http://github.com/jugyo/kvs'
  s.rubyforge_project = 'kvs'
  s.has_rdoc = false
end

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true
end

task :gemspec do
  filename = "#{name}.gemspec"
  open(filename, 'w') do |f|
    f.write spec.to_ruby
  end
  puts <<-EOS
  Successfully generated gemspec
  Name: #{name}
  Version: #{version}
  File: #{filename}
  EOS
end

task :install => [ :package ] do
  sh %{sudo gem install pkg/#{name}-#{version}.gem}
end

task :uninstall => [ :clean ] do
  sh %{sudo gem uninstall #{name}}
end

desc 'run all specs'
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['-c']
end

CLEAN.include ['pkg']
