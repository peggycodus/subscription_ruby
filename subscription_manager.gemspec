# encoding: UTF-8


Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'subscription_manager'
  s.version     = version Aug 3, 2014
  s.summary     = 'use to manage paper and online subscription payments, renewals and deductions'
  s.description = ''

  s.required_ruby_version = '>= 2.1.1'
  s.author      = 'Peggy Condon'
  s.email       = 'pcondon@bestangle.com'
  s.homepage    = ''
  s.license     = MIT

  s.files        = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  s.require_path = 'lib'

  s.add_dependency ''