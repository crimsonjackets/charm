require 'helper'

describe Charm::Account do
  subject { create :account }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
