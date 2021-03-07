# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contacts::ImportService, type: :service do
  let(:import) { Import.new }
  let(:user) { create :user }
  let(:file) { Rails.root.join 'spec/fixtures/contacts.csv' }

  subject(:service) { described_class.new(file: file, user: user, import: import) }

  context 'when the parameters are valid' do
    it 'returns true' do
      expect(service.execute!).to be true
    end

    it 'creates a new contact version' do
      expect { service.execute! }.to change(contact, :count).by(1)
    end
  end
end
