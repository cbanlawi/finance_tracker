require "rails_helper"

RSpec.describe Expense, type: :model do
  let(:expense) { build(:expense, name: name, amount: amount, date: date) }
  let(:name) { "Internet Bill" }
  let(:amount) { 69.00 }
  let(:date) { Date.new(2025, 1, 31) }

  shared_examples "a field that is required" do |field|
    let(field) { nil }

    it "is invalid and provides a validation error" do
      expect(expense).to be_invalid
      expect(expense.errors[field]).to include("can't be blank")
    end
  end

  describe "validations" do
    context 'when all attributes are valid' do
      it { expect(expense).to be_valid }
    end

    context 'when name is nil' do
      it_behaves_like "a field that is required", :name
    end

    context 'when amount is nil' do
      it_behaves_like "a field that is required", :amount
    end

    context 'when date is nil' do
      it_behaves_like "a field that is required", :date
    end

    context 'when amount is negative' do
      let(:amount) { -69.00 }

      it 'is invalid and provides a validation error' do
        expect(expense).to be_invalid
        expect(expense.errors[:amount]).to include("must be greater than 0")
      end
    end

    context 'when amount is zero' do
      let(:amount) { 0 }

      it 'is invalid and provides a validation error' do
        expect(expense).to be_invalid
        expect(expense.errors[:amount]).to include("must be greater than 0")
      end
    end
  end
end
