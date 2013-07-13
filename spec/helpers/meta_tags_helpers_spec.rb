require 'helper'

describe Charm::MetaTagsHelper do
  describe '#render_title' do
    specify do
      helper.stub(:content_for?).and_return(false)
      helper.stub(:content_for).and_return(nil)
      helper.render_title.should == nil

      helper.stub(:content_for?).with(:heading).and_return(true)
      helper.stub(:content_for).with(:heading).and_return('<strong>bar</strong>'.html_safe)
      helper.render_title.should == '<title>bar</title>'

      helper.stub(:content_for?).with(:title).and_return(true)
      helper.stub(:content_for).with(:title).and_return('foo')
      helper.render_title.should == '<title>foo</title>'

      title = create :title
      helper.request.stub(:fullpath).and_return(title.path)
      helper.render_title.should == "<title>#{title.value}</title>"
    end

    specify do
      helper.render_meta_tags.should == nil
    end
  end
end
