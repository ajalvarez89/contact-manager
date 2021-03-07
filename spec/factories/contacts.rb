# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    sequence(:email) { |n| "person#{ n }@example.com" }
    sequence(:name) { Faker::Name.name }
    birth_date { Faker::Date.between(from: '1989-01-01', to: '2014-12-30') }
    phone { '+57 302 351 5542' }
    address { Faker::Address.street_address }
    credit_card { '458556165491321' }
    card_type { 'mastercard' }
    association :user
  end
end
