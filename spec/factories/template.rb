FactoryGirl.define do
  factory :template, class: Charm::Template do
    path { "/#{Faker::HipsterIpsum.sentence(rand(5..10)).chop.parameterize}" }
    file { path[1..-1] }
  end
end
