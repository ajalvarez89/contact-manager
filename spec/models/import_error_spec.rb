# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportError, type: :model do
  describe 'Validations' do
    it 'validates associations' do
      should belong_to(:import)
    end
  end
end
