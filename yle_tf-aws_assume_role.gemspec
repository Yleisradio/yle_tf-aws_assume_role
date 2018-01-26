lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yle_tf-aws_assume_role/version'

Gem::Specification.new do |spec|
  spec.name        = 'yle_tf-aws_assume_role'
  spec.version     = YleTfPlugins::AWSAssumeRole::VERSION
  spec.summary     = 'A plugin for yle_tf for assuming AWS IAM roles'
  spec.description = spec.summary
  spec.homepage    = 'https://github.com/Yleisradio/yle_tf-aws_assume_role'
  spec.license     = 'MIT'

  spec.authors = [
    'Yleisradio',
    'Teemu Matilainen',
  ]
  spec.email = [
    'devops@yle.fi',
    'teemu.matilainen@reaktor.com',
  ]

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'yle-aws-role', '~> 2.0'
  spec.add_dependency 'yle_tf', '>= 0.1.1'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
