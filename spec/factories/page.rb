FactoryGirl.define do
  factory :page do
    path { "/#{heading.parameterize}" }
    sequence(:published_at) { |n| "31.12.2011 #{rand(19..22)}:#{rand(0..59)}:#{rand(0..59)}".to_time + n.days }
    heading { Faker::HipsterIpsum.sentence(rand(5..10)).chop }
    body { Faker::HipsterIpsum.paragraphs(rand(5..15)).inject { |body, paragraph| body + ["\n\n", " "].sample + paragraph } }
  end
end
