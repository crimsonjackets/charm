RSpec::Matchers.define :be_collection_of_meta_tags_with_attributes do |attributes|
  match do |actual|
    meta_tags = Nokogiri::HTML::DocumentFragment.parse(helper.render_meta_tags).children

    result = meta_tags.count == attributes.count

    meta_tags.each_with_index do |meta_tag, index|
      result &= meta_tag.name == 'meta'
      result &= meta_tag.attributes.count == attributes[index].try(:count)

      attributes[index].try(:each) do |name, value|
        result &= meta_tag[name] == value
      end
    end

    result
  end
end
