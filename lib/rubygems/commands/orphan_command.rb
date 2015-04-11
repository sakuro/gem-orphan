require 'rubygems/command'

class Gem::Commands::OrphanCommand < Gem::Command

  def initialize
    super 'orphan', 'Show gems which are required from nothing.'
  end

  def execute
    specs = Gem::Specification.to_a
    dependencies = specs.map(&:dependencies).flatten.uniq
    runtime_dependencies = dependencies.select {|dep| dep.type == :runtime }

    specs.delete_if {|spec| runtime_dependencies.any? {|dep| dep.name == spec.name} }

    specs.each do |spec|
      say "#{spec.name} (#{spec.version})"
    end
  end

end

