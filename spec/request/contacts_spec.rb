# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  describe 'GET /contacts' do
    it 'is redirect to contacts index' do
      get contacts_path
      expect(response).to have_http_status(200)
    end
  end
end
