Gem::Specification.new do |s|
  s.name        = 'scraper_worker'
  s.version     =  '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'scraper_worker'
  s.description = 'scraper_worker'
  s.authors     = ['Nick H']
  s.email       = ''
  s.homepage    = ''

  s.files                 = `find * -type f -print`.split("\n")
  # s.require_paths         = ['lib']
  s.required_ruby_version = '>= 3.1.0'
end
