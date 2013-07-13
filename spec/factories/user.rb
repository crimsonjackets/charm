FactoryGirl.define do
  factory :user do
    type 'User'
    sequence(:name) { |n| "Name#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
  end
end
