Gem::Specification.new do |s|
  s.name = 'gem-orphan'
  s.author = 'OZAWA Sakuro'
  s.author = 'sakuro@2238club.org'
  s.rubyforge_project = ''
  s.homepage = nil
  s.platform = Gem::Platform::RUBY
  s.summary = 'A RubyGems plugin to show orphaned gems.'
  s.description = <<-EOF
  A RubyGems plugin to show orphaned gems.
  EOF
  s.version = '0.0.1'
  s.files = <<-FILES.split
    lib/rubygems/commands/orphan_command.rb
    lib/rubygems_plugin.rb
    Rakefile
    gem-orphan.gemspec
  FILES
end
