require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /dashboard" do
    it 'returns the dashboard page' do
      get '/dashboard'
      expect(response).to have_http_status(200)
      expect(response.body).to include("Welcome back, #{user.email}!")
    end
  end
end
