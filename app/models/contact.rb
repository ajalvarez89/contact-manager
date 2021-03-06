# frozen_string_literal: true
require 'csv'

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

  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep: ';', header_converters: :symbol) do |row|
      row = row.to_hash.with_indifferent_access
      Contact.create! row
    end
  end
end
