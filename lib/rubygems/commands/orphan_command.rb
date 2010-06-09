require 'rubygems/command'
require 'rubygems/source_index'

class Gem::Commands::OrphanCommand < Gem::Command

  def initialize
    super 'orphan', 'Show gems which are required from nothing.'
  end

  def execute
    index = Gem::SourceIndex.from_installed_gems
    specs = index.map {|name, spec| spec }
    dependencies = specs.map(&:dependencies).flatten.uniq
    runtime_dependencies = dependencies.select {|dep| dep.type == :runtime }

    specs.delete_if {|spec| runtime_dependencies.any? {|dep| dep.name == spec.name} }

    specs.each do |spec|
      say "#{spec.name} (#{spec.version})"
    end
  end

end

