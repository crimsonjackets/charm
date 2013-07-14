# encoding: utf-8

require 'helper'

describe Charm::MetaTagsHelper do
  describe '#render_title' do
    specify do
      helper.stub(:content_for?).and_return(false)
      helper.stub(:content_for).and_return(nil)
      helper.render_title.should be_blank

      helper.stub(:content_for?).with(:heading).and_return(true)
      helper.stub(:content_for).with(:heading).and_return('<strong>bar</strong>'.html_safe)
      helper.render_title.should be_title_tag_with_text('bar')

      helper.stub(:content_for?).with(:title).and_return(true)
      helper.stub(:content_for).with(:title).and_return('foo')
      helper.render_title.should be_title_tag_with_text('foo')

      title = create :title
      helper.request.stub(:fullpath).and_return(title.path)
      helper.render_title.should be_title_tag_with_text(title.value)
    end
  end

  describe '#render_meta_tags' do
    specify do
      path = '/foo/bar'
      meta_tag_attributes = [
        { name: 'description', content: 'awesome' },
        { itemprop: 'image', content: '/assets/favicon.png' },
        { name: 'author', content: 'Олег' },
      ]

      helper.request.stub(:fullpath).and_return(path)

      helper.render_meta_tags.should be_blank

      create :meta_tag, path: path, data: meta_tag_attributes[0]
      helper.render_meta_tags.should be_collection_of_meta_tags_with_attributes(meta_tag_attributes.slice(0, 1))

      create :meta_tag, path: path, data: meta_tag_attributes[1]
      helper.render_meta_tags.should be_collection_of_meta_tags_with_attributes(meta_tag_attributes.slice(0, 2))

      create :meta_tag, path: path, data: meta_tag_attributes[2]
      helper.render_meta_tags.should be_collection_of_meta_tags_with_attributes(meta_tag_attributes.slice(0, 3))
    end
  end
end
