require 'helper'

shared_examples_for Charm::HasPath do
  it { should validate_presence_of(:path) }

  %w[foo foo/bar].each do |wrong_path|
    it { should_not allow_value(wrong_path).for(:path) }
  end

  %w[/foo /foo/bar].each do |correct_path|
    it { should allow_value(correct_path).for(:path) }
  end
end
