# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calculator/version'

Gem::Specification.new do |spec|
  spec.name          = 'calculator'
  spec.version       = Calculator::VERSION
  spec.authors       = ['Kelvin Smith']
  spec.email         = ['oneKelvinSmith@gmail.com']

  spec.summary       = 'A simple calculator'

  spec.homepage      = 'http://www.github.com/oneKelvinSmith/calculator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',       '~> 1.10'
  spec.add_development_dependency 'rake',          '~> 10.0'
  spec.add_development_dependency 'awesome_print', '~> 1.6'
  spec.add_development_dependency 'pry',           '~> 0.10'
  spec.add_development_dependency 'rspec',         '~> 3.3'
  spec.add_development_dependency 'roda',          '~> 2.4'
  spec.add_development_dependency 'slim',          '~> 3.0'
  spec.add_development_dependency 'puma',          '~> 2.4'
end
