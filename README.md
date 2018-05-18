# YleTf Plugin for Assuming AWS IAM Roles

[![Gem Version](https://badge.fury.io/rb/yle_tf-aws_assume_role.svg)](https://badge.fury.io/rb/yle_tf-aws_assume_role)
[![Build Status](https://travis-ci.org/Yleisradio/yle_tf-aws_assume_role.svg?branch=master)](https://travis-ci.org/Yleisradio/yle_tf-aws_assume_role)

A plugin for [yle_tf](https://github.com/Yleisradio/yle_tf) for assuming AWS IAM roles using [yle-aws-role](https://github.com/Yleisradio/yle-aws-role).

## Installation

If you are running `tf` standalone, install the plugin with:

```sh
gem install yle_tf-aws_assume_role
```

and configure it for YleTf by listing it in the `TF_PLUGINS` environment variable. For example in Posix shells:
```sh
export TF_PLUGINS='yle_tf-aws_assume_role'
```

If you install and use YleTf from your own software or wrappers, add this line to your application's Gemfile for automatic plugin loading:

```ruby
group :tf_plugins do
  gem 'yle_tf-aws_assume_role'
end
```

You can also add it without group definition, and load it in the code:

```ruby
require 'yle_tf-aws_assume_role'
```

## Configuration

Example `tf.yaml` configuration:

```yaml
aws:
  assume_role: true
  account: "98765432100"
  role: dev
  duration: 1800
```

## Development

After checking out the repo, run `bundle update` to install and update the dependencies. Then, run `bundle exec rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yleisradio/yle_tf-aws_assume_role. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
