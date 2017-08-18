# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'action_dispatch-br_static'
  gem.version       = '0.0.1'
  gem.authors       = ['Bohdan Derevenets']
  gem.email         = ['dbodyas@gmail.com']
  gem.description   = 'Serves precompiled *.br files created by asset pipeline'
  gem.summary       = 'Serves precompiled *.br files created by asset pipeline'
  gem.homepage      = 'https://github.com/bodya-dnepr/action_dispatch-br_static'

  gem.add_dependency('actionpack', '>= 3.1.0')
  gem.add_dependency('railties', '>= 3.1.0')

  gem.files         = `git ls-files`.split($/).collect { |str| str[0] == '"' ? eval(str) : str }
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
