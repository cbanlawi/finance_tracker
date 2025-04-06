class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense, notice: "Expense was successfully created."
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      redirect_to @expense, notice: "Expense was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path, notice: "Expense was successfully deleted."
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category, :date)
  end
end
