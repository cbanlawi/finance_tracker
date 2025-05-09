class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [ :show, :edit, :update, :destroy ]

  def index
    @expenses = current_user.expenses
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      redirect_to @expense, notice: "Expense was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: "Expense was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: "Expense was successfully deleted."
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category, :date)
  end
end
