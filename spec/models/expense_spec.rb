require "rails_helper"

RSpec.describe Expense, type: :model do
  it "is valid with valid attributes" do
    expense = Expense.new(name: "Internet Bill", amount: 69.00, date: Date.new(2025, 1, 31), category: "Utilities")
    expect(expense).to be_valid
  end

  it "is invalid without a name" do
    expense = Expense.new(amount: 69.00, date: Date.new(2025, 1, 31), category: "Utilities")
    expect(expense).not_to be_valid
  end

  it "is invalid without an amount" do
    expense = Expense.new(name: "Internet Bill", date: Date.new(2025, 1, 31), category: "Utilities")
    expect(expense).not_to be_valid
  end

  it "is invalid if the amount is not greater than 0" do
    expense = Expense.new(name: "Internet Bill", amount: 0, date: Date.new(2025, 1, 31), category: "Utilities")
    expect(expense).not_to be_valid
  end

  it "is invalid without a date" do
    expense = Expense.new(name: "Internet Bill", amount: 69.00, category: "Utilities")
    expect(expense).not_to be_valid
  end
end
