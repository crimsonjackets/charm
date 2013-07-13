FactoryGirl.define do
  factory :admin do
    type 'Admin'
    sequence(:name) { |n| "Name#{n}" }
    sequence(:email) { |n| "admin#{n}@test.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
  end
end
