# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Validations' do
    let(:contact) { create :contact }

    it 'validates associations' do
      should belong_to(:user)
    end

    it 'validates attributes presence' do
      should validate_presence_of(:name)
      should validate_presence_of(:email)
      should validate_presence_of(:birth_date)
      should validate_presence_of(:phone)
      should validate_presence_of(:address)
      should validate_presence_of(:credit_card)
      should define_enum_for(:card_type)
        .with_values(%i[visa mastercard american])
    end

    it 'is invalid without a email' do
      contact.user = nil
      contact.valid?
      expect(contact.errors).to include(:user)
    end
  end
end
