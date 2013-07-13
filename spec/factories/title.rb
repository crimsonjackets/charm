FactoryGirl.define do
  factory :title do
    path { "/#{value.parameterize}" }
    value { Faker::HipsterIpsum.sentence(rand(5..10)).chop }
  end
end
