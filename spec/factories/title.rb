FactoryGirl.define do
  factory :title, class: Charm::Title do
    path { "/#{value.parameterize}" }
    value { Faker::HipsterIpsum.sentence(rand(5..10)).chop }
  end
end
