require 'helper'

describe Template do
  subject { create :template }

  it_behaves_like Charm::HasPath
end
