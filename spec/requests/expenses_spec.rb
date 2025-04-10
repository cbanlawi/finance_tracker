require 'rails_helper'

RSpec.describe "Expenses", type: :request do
  let(:user) { create(:user) }
  let!(:expense) { create(:expense, user: user) }

  before do
    sign_in user
  end

  describe "GET /expenses" do
    it 'returns a list of expenses' do
      get '/expenses'
      expect(response).to have_http_status(200)
      expect(response.body).to include(expense.name)
    end
  end

  describe "GET /expenses/:id" do
    it 'returns a single expense' do
      get "/expenses/#{expense.id}"
      expect(response).to have_http_status(200)
      expect(response.body).to include(expense.name)
    end
  end

  describe "GET /expenses/new" do
    it 'returns a form for a new expense' do
      get '/expenses/new'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /expenses" do
    it 'creates a new expense' do
      expense_params = { expense: { name: "Electricity Bill", amount: 250.00, date: Date.new(2025, 2, 1), category: "Utilities" } }

      expect { post '/expenses', params: expense_params }.to change(Expense, :count).by(1)
      expect(response).to redirect_to(Expense.last)
      follow_redirect!
      expect(response.body).to include(Expense.last.name)
    end
  end

  describe "GET /expenses/:id/edit" do
    it 'returns a form to edit an expense' do
      get "/expenses/#{expense.id}/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /expenses/:id" do
    it 'updates an expense' do
      updated_expense_params = { expense: { name: "Updated Bill", amount: 275.00 } }

      patch "/expenses/#{expense.id}", params: updated_expense_params
      expect(response).to redirect_to(expense)
      follow_redirect!
      expect(response.body).to include(expense.reload.name)
    end
  end

  describe "DELETE /expenses/:id" do
    it 'deletes an expense' do
      expect { delete "/expenses/#{expense.id}" }.to change(Expense, :count).by(-1)
      expect(response).to redirect_to(expenses_path)
    end
  end
end
