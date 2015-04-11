lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem/orphan/version'

Gem::Specification.new do |spec|
  spec.name          = 'gem-orphan'
  spec.version       = Gem::Orphan::VERSION
  spec.authors       = ['OZAWA Sakuro']
  spec.email         = %w(sakuro@users.noreply.github.com)

  spec.summary       = 'A RubyGems plugin to show orphaned gems.'
  spec.description   = <<-EOF.gsub(/^    /, '')
    gem-orphan is a naive implementation of the 'orphan' subcommand.
    It finds gems on which no other gems are depending and lists such gems.
  EOF
  spec.homepage      = 'https://github.com/sakuro/gem-orphan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  if spec.respond_to?(:metadata)
    spec.metadata.delete 'allowed_push_host'
  end

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
