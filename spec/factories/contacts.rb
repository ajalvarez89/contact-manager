# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:name) { |n| "person #{n}" }
    birth_date { Date.today }
    phone { '300000000' }
    address { 'Calle 100' }
    credit_card { '458556165491321' }
    card_type { 'Mastercard' }
    user { nil }
  end
end
