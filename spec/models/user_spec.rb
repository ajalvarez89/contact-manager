# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject(:user) do
      described_class.new(
        email: 'alvaro@test.com',
        password: '123456'
      )
    end

    it 'validates associations' do
      should have_many(:contacts)
    end

    it 'validates attributes presence' do
      should validate_presence_of(:email)
    end

    # it 'validates attributes uniqueness' do
    #   should validate_uniqueness_of(:name)
    # end

    it 'is invalid without a email' do
      subject.email = nil
      subject.valid?
      expect(subject.errors).to include(:email)
    end
  end
end
