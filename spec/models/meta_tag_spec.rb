require 'helper'

describe MetaTag do
  subject { create :meta_tag }

  it_behaves_like Charm::HasPath
end
