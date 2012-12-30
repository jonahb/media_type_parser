Gem::Specification.new do |s|
  s.name = 'media_type_parser'
  s.version = '0.0.1'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Parses HTTP media types'
  s.description = s.summary
  s.author = "Jonah Burke"

  s.required_ruby_version = '~> 1.9.2'
  s.required_rubygems_version = '>= 1.8.24'

  s.files        = Dir.glob( 'lib/**/*' )
  s.require_path = 'lib'

  s.add_dependency 'treetop', '~> 1.4.12'
end
