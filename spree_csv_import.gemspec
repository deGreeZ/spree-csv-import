# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'spree_csv_import'
  s.version = '0.0.1'
  s.summary = 'Adds possibility to import products list from CSV file'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Maks Sleptsov'
  s.email     = 'maksimator@gmail.com'

  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3.2'

  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
