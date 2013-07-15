require 'helper'

describe Charm::ErrorsHelper do
  describe '#errors_for' do
    let(:valid_record) { create(:page) }
    let(:invalid_record) do
      record = build(:page, path: nil, heading: nil, body: nil)
      record.valid?
      record
    end

    let(:wrong_options) { { only: [ :title, :path ], except: [ :heading, :body ] } }
    let(:only_options) { { only: [ :path, :heading ] } }
    let(:except_options) { { except: [ :path, :heading ] } }

    specify do
      expect { helper.errors_for(invalid_record, wrong_options) }.to raise_error
      expect { helper.errors_for(valid_record, wrong_options) }.to raise_error

      helper.errors_for(valid_record).should be_empty
      helper.errors_for(valid_record, only_options).should be_empty
      helper.errors_for(valid_record, except_options).should be_empty

      helper.errors_for(invalid_record).size.should == 3
      helper.errors_for(invalid_record, only_options).size.should == 2
      helper.errors_for(invalid_record, except_options).size.should == 1
    end
  end

  describe '#render_errors' do
    specify do
      helper.render_errors([]).should be_nil
      helper.render_errors([1]).should have_css('li', count: 1)
      helper.render_errors([1, 1]).should have_css('li', count: 2)
      helper.render_errors([1, 1, 1]).should have_css('li', count: 3)

      helper.render_errors(['foo']).should have_content('foo')
    end
  end
end
