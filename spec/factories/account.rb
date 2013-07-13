FactoryGirl.define do
  factory :account do
    type { %w[User Admin].sample }
    name { [:male, :female].sample.instance_eval { "#{Faker::NameRU.first_name(self)} #{Faker::NameRU.last_name(self)}" } }
    email { "#{Russian::Transliteration.transliterate(name).downcase.sub(' ', '.')}@crimsonjackets.ru" }
    password 'secret'
    password_confirmation 'secret'

    factory :user do
      type 'User'
    end

    factory :admin do
      type 'Admin'
    end
  end
end
