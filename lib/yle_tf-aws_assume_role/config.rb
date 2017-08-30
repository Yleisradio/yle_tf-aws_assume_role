module YleTfPlugins
  module AWSAssumeRole
    class Config
      attr_reader :action_config, :tf_config

      def initialize(action_config, tf_config)
        @action_config = action_config
        @tf_config = tf_config
      end

      def assume_role?
        self[:assume_role]
      end

      def [](key)
        @action_config.fetch(key.to_sym) { tf_config.fetch('aws', key.to_s) }
      end
    end
  end
end
