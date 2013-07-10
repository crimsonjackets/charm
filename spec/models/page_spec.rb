require 'helper'

describe Page do
  it { should allow_value('').for(:slug) }
  it { should_not allow_value(nil).for(:slug) }
  it { should validate_presence_of(:heading) }
  it { should validate_presence_of(:body) }
end
