require 'helper'

describe Charm::Configuration do
  subject { Charm::Configuration.instance }

  describe '.defaults' do
    specify { subject.class.defaults.should be_a_kind_of(Hash) }
  end

  describe '#error_pages' do
    specify { subject.error_pages.should be_a_kind_of(Hash) }
  end
end
