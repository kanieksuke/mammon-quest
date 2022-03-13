class BudgetsController < ApplicationController
  before_action :move_to_new, only: [:edit, :update]

  def edit
    @target = Target.find(params[:id])
    @budget = Budget.find(params[:id])
    @messages = @target.messages.includes(:target).order("created_at DESC")
  end

  def update
    @target = Target.find(params[:id])
    @budget = Budget.update(budget_params)
    @messages = @target.messages.includes(:target).order("created_at DESC")
    create_attack
  end

  private

  def budget_params
    params.require(:budget).permit(:income, :fixed_cost).merge(target_id: params[:target_id])
  end

  def create_attack
    d = Date.new(Time.now.year, Time.now.month, -1).day
    @attack = (@target.budget.income - @target.budget.fixed_cost) / d - @target.shopping.resist
  end

  def move_to_new
    if current_user.target == nil
      redirect_to new_target_path
    end
  end
end
