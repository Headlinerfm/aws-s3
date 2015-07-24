# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws/s3/version'

Gem::Specification.new do |s|
  s.name              = 'aws-s3'
  s.version           = AWS::S3::Version
  s.summary           = "Client library for Amazon's Simple Storage Service's REST API"
  s.description       = s.summary
  s.email             = 'marcel@vernix.org'
  s.author            = 'Marcel Molina Jr.'
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.rdoc COPYING INSTALL)
  s.homepage          = 'http://amazon.rubyforge.org'
  s.rubyforge_project = 'amazon'
  s.files             = `git ls-files`.split("\n")
  s.executables       << 's3sh'
  s.test_files        = Dir['test/**/*']

  s.add_dependency 'xml-simple'
  s.add_dependency 'builder'
  s.add_dependency 'mime-types'

  s.add_development_dependency "rake", "~> 10.1"
  s.add_development_dependency "flexmock", "~> 1.2"
  s.add_development_dependency "simplecov"

  s.rdoc_options  = ['--title', "AWS::S3 -- Support for Amazon S3's REST api",
                     '--main',  'README.rdoc',
                     '--line-numbers', '--inline-source']
  s.license = "MIT"
end
