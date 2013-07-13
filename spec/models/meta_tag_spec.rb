require 'helper'

describe MetaTag do
  subject { create :meta_tag }

  it { should validate_presence_of(:path) }
end
