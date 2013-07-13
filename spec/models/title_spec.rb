require 'helper'

describe Title do
  subject { create :title }

  it { should validate_presence_of(:path) }
  it { should validate_uniqueness_of(:path) }
end
