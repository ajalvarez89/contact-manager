# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    email { 'MyString' }
    name { 'MyString' }
    birth_date { 'MyString' }
    phone { 'MyString' }
    address { 'MyString' }
    credit_card { 'MyString' }
    card_type { 'MyString' }
    user { nil }
  end
end
