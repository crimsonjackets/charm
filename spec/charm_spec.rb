require 'helper'

describe Charm do
  describe '.config' do
    specify { Charm.config.should be_a_kind_of(Charm::Configuration) }
  end

  describe '.configure' do
    specify { Charm.configure { |config| config.should be_a_kind_of(Charm::Configuration) } }
    specify { expect { Charm.configure }.to raise_error(LocalJumpError) }
  end
end
