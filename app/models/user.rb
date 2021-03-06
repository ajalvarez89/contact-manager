# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :contacts

  accepts_nested_attributes_for :contacts, allow_destroy: true

  validates :email, presence: true
end
