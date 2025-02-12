class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end
end
