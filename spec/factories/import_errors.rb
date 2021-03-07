# frozen_string_literal: true

FactoryBot.define do
  factory :import_error do
    contact { {} }
    contact_error { { email: ['debe ser único por usuario'] } }
  end
end
