RSpec::Matchers.define :be_title_tag_with_text do |text|
  match do |actual|
    title = Nokogiri::HTML::DocumentFragment.parse(actual).children

    title.count == 1 && title[0].name == 'title' && title[0].attributes.count == 0 && title[0].text == text
  end
end
