class TargetsController < ApplicationController

  def edit
    @target_budget = TargetBudget.new
    if current_user.target == nil
      render :new
    end
  end

  def new
    @target_budget = TargetBudget.new
  end

  def create
    @target_budget = TargetBudget.new(target_params)
    target_budget_params_addition
    if @target_budget.valid?
      @target_budget.save
      redirect_to targets_path(@target_budget)
    else
      render :new
    end
  end

  def index
    @targets = Target.includes(:user).order("created_at DESC")
    @budgets = Budget.includes(:user).order("created_at DESC")
    binding.pry
  end

  private

  def target_params
    params.require(:target_budget).permit(:target_amount, :target_date, :income, :fixed_cost).merge(user_id: current_user.id)
  end

  def target_budget_params_addition
    @target_budget.current_amount = @target_budget.target_amount
    @target_budget.current_date = 0
    @target_budget.resist = 0
  end
end
