# frozen_string_literal: true

require 'spec_helper'

describe YleTfPlugins::AWSAssumeRole do
  it 'loads' do
    expect { require 'yle_tf-aws_assume_role' }.to_not raise_error
  end
end
