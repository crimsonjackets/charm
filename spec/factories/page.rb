FactoryGirl.define do
  factory :page do
    path { "/#{heading.parameterize}" }
    heading { Faker::HipsterIpsum.sentence(rand(5..10)).chop }
    body { Faker::HipsterIpsum.paragraphs(rand(5..15)).inject { |body, paragraph| body + ["\n\n", " "].sample + paragraph } }
    published true
    sequence(:published_at) { |n| "31.12.2011 #{rand(19..22)}:#{rand(0..59)}:#{rand(0..59)}".to_time + n.days }

    factory :published_page do
      published true
      sequence(:published_at) { |n| "31.12.2011 #{rand(19..22)}:#{rand(0..59)}:#{rand(0..59)}".to_time + n.days }
    end

    factory :not_published_page do
      published false
    end

    factory :not_yet_published_page do
      published true
      sequence(:published_at) { |n| DateTime.now.change(hour: rand(19..22), min: rand(0..59), sec: rand(0..59)) + 1.week + n.days }
    end
  end
end
