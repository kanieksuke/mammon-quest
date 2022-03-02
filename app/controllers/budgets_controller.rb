class BudgetsController < ApplicationController
  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    budget_params_addition
    if @budget.save
      redirect_to root_path(@budget)
    else
      render :new
    end
  end

  private
  def budget_params
    params.require(:budget).permit(:income, :fixed_cost).merge(user_id: current_user.id, target_id: params[:target_id])
  end

  def budget_params_addition
    d = Date.new(Time.now.year, Time.now.month, -1).day
    if @budget.income =! nil && @budget.fixed_cost =! nil
      @budget.attack = (@budget.income - @budget.fixed_cost) / d
    else
      @budget.attack = 0
    end
    @budget.resist = 0
  end

end
