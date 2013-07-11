Gem::Specification.new do |s|
  s.name = 'charm'
  s.version = '1.0.0.rc1'
  s.summary = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
  s.homepage = 'https://github.com/crimsonjackets/charm'
  s.author = 'Vladimir Sazhin'
  s.email = 'author@cannie.net'
  s.files = Dir['{app,bin,config,db,lib}/**/*', '{LICENSE,README}.md']
  s.executables = %w[charm]
  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'pg'
  s.add_dependency 'slim', '~> 2.0.0'
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'jquery-rails', '~> 3.0.1'
  s.add_dependency 'turbolinks', '~> 1.2.0'
  s.add_development_dependency 'rspec-rails', '~> 2.14.0.rc1'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.1'
  s.add_development_dependency 'capybara', '~> 2.1.0'
  s.add_development_dependency 'ffaker', '~> 1.16.1'
end
