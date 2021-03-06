# frozen_string_literal: true

class Contact < ApplicationRecord
  enum card_type: %i[visa mastercard american]

  belongs_to :user

  validates :name,
    :email,
    :birth_date,
    :phone,
    :address,
    :credit_card,
    :card_type,
    presence: true
  validates_uniqueness_of :email, scope: :user_id, message: 'debe ser único por usuario', case_sensitive: false
end
