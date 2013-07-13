require 'helper'

describe Page do
  subject { create :page }

  it { should validate_presence_of(:path) }
  it { should validate_uniqueness_of(:path) }

  it { should validate_presence_of(:heading) }
  it { should validate_presence_of(:body) }
end
