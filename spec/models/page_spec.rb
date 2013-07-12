require 'helper'

describe Page do
  it { should validate_presence_of(:path) }
  it { should validate_presence_of(:heading) }
  it { should validate_presence_of(:body) }
end
