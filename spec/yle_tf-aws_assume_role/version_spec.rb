# frozen_string_literal: true

require 'spec_helper'

require 'yle_tf-aws_assume_role/version'

describe YleTfPlugins::AWSAssumeRole do
  it 'has a version number' do
    expect(YleTfPlugins::AWSAssumeRole::VERSION).not_to be nil
  end
end
