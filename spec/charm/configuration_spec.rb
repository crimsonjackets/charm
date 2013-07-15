require 'helper'

describe Charm::Configuration do
  subject { Charm::Configuration.instance }

  describe '.defaults' do
    specify { subject.class.defaults.should be_a_kind_of(Hash) }
  end

  describe '#error_pages' do
    specify { subject.error_pages.should be_a_kind_of(Hash) }
  end

  describe '#templates' do
    specify do
      template_attributes = [
        { path: '/foo/bar', file: 'foo_bar' },
        { path: '/bar/bazz', file: 'bar_bazz' }
      ]

      subject.templates = []
      subject.templates[0] = template_attributes[0]
      subject.templates.should == template_attributes.slice(0, 1)

      subject.templates << template_attributes[1]
      subject.templates.should == template_attributes

      subject.templates = []
      subject.templates.should == []
    end
  end
end
