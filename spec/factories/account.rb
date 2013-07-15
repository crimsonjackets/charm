FactoryGirl.define do
  factory :account, class: Charm::Account do
    name { [:male, :female].sample.instance_eval { "#{Faker::NameRU.first_name(self)} #{Faker::NameRU.last_name(self)}" } }
    email { "#{Russian::Transliteration.transliterate(name).downcase.sub(' ', '.')}@crimsonjackets.ru" }
    password 'secret'
    password_confirmation 'secret'
  end
end
