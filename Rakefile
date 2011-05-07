require 'rubygems/package_task'
require 'rake/clean'

spec = Gem::Specification.load('gem-orphan.gemspec')

Gem::PackageTask.new(spec) do |t|
  t.need_zip = true
  t.need_tar = true
end
