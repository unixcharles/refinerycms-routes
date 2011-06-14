Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-routes'
  s.version           = '1.0'
  s.description       = 'Custom routing for Refinery CMS'
  s.date              = '2011-06-01'
  s.summary           = 'Refinery CMS engine that allow you to manage custom localized routes and redirection.'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
