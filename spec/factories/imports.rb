# frozen_string_literal: true

FactoryBot.define do
  factory :import do
    file_path { 'path' }
    status { 'finished' }
    association :user
    association :import_error
  end
end
