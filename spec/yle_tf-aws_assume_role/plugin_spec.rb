# frozen_string_literal: true

require 'spec_helper'

require 'yle_tf-aws_assume_role/plugin'

describe YleTfPlugins::AWSAssumeRole::Plugin do
  it 'registers' do
    expect(YleTf::Plugin.manager.registered).to include(described_class)
  end
end
