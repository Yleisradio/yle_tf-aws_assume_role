require 'yle-aws-role'
require 'yle_tf/error'
require 'yle_tf/logger'

require_relative 'config'

module YleTfPlugins
  module AWSAssumeRole
    class Action
      def initialize(app, **config)
        @app = app
        @action_config = config
      end

      def call(env)
        config = Config.new(@action_config, env[:config])

        if !assume_role?(config, env)
          @app.call(env)
          return
        end

        assume_role(config) do |role|
          env[:aws_role_assumed] = role
          @app.call(env)
          env[:aws_role_assumed] = nil
        end
      end

      def assume_role?(config, env)
        reason = if env[:aws_role_assumed]
                   'AWS IAM role already assumed'
                 elsif !config.assume_role?
                   'Not assuming AWS IAM role'
                 end

        return true if !reason

        YleTf::Logger.debug(reason)
        false
      end

      def assume_role(config, &block)
        account  = config[:account]
        role     = config[:role]
        duration = config[:duration]

        YleTf::Logger.debug("Assuming AWS IAM role '#{account}:#{role}'")
        ::Yle::AWS::Role.assume_role(account, role, duration, &block)
      rescue ::Yle::AWS::Role::Errors::AssumeRoleError => e
        raise YleTf::Error, e, e.backtrace
      end
    end
  end
end
