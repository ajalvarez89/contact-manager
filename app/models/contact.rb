# frozen_string_literal: true

require 'csv'

class Contact < ApplicationRecord
  NAME_REGEXP = /\A^[^-]*$\Z/.freeze
  PHONE_REGEXP = /\A^\+(?:[0-9] ?){6,14}[0-9]$\Z/.freeze

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
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :name, format: { with: NAME_REGEXP }
  validates :phone, format: { with: PHONE_REGEXP }
  validates_uniqueness_of :email, scope: :user_id, message: 'debe ser único por usuario', case_sensitive: false

  def self.import(file, user)
    @import = Import.new
    service = Contacts::ImportService.new(file: file, user: user, import: @import)

    service.execute!
  end
end
