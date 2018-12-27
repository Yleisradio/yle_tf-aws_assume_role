# frozen_string_literal: true

require 'yle_tf'

module YleTfPlugins
  module AWSAssumeRole
    class Plugin < YleTf::Plugin
      register

      default_config(
        'aws' => {
          'assume_role' => false,
          'account'     => nil,
          'role'        => nil,
          'duration'    => 3600,
        }
      )

      action_hook do |hook|
        require_relative 'action'
        hook.before(YleTf::Action::TfHooks, Action)
      end

      command('_asu', 'Executes shell with the assumed role without Terraform env') do
        require_relative 'action'
        require 'yle_tf_plugins/commands/_shell/command'

        YleTf::Action::Builder.new do
          use YleTf::Action::LoadConfig
          use Action
          use YleTf::Action::Command, YleTfPlugins::CommandShell::Command
        end
      end
    end
  end
end
