# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Import, type: :model do
  describe 'Validations' do
    it 'validates associations' do
      should have_many(:import_errors)
      should belong_to(:user)
    end

    it 'validates attributes presence' do
      should validate_presence_of(:file_path)
      should validate_presence_of(:status)
    end
  end
end
