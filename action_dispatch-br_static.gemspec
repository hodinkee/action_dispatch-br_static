# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'action_dispatch-br_static'
  gem.version       = '0.0.1'
  gem.authors       = ['Bohdan Derevenets', 'Ryan LeFevre']
  gem.email         = ['dbodyas@gmail.com', 'ryan@hodinkee.com']
  gem.description   = 'Serves precompiled *.br files created by asset pipeline or webpack'
  gem.summary       = 'Serves precompiled *.br files created by asset pipeline or webpack'
  gem.homepage      = 'https://github.com/hodinkee/action_dispatch-br_static'

  gem.add_dependency('actionpack', '>= 5.0.0')
  gem.add_dependency('railties', '>= 5.0.0')

  gem.files         = `git ls-files`.split($/).collect { |str| str[0] == '"' ? eval(str) : str }
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
