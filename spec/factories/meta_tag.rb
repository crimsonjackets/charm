FactoryGirl.define do
  factory :meta_tag, class: Charm::MetaTag do
    path { "/#{Faker::HipsterIpsum.sentence(rand(5..10)).chop.parameterize}" }
    data { Hash.new }
  end
end
