require 'helper'

describe Title do
  subject { create :title }

  it_behaves_like Charm::HasPath
  it { should validate_uniqueness_of(:path) }
end
