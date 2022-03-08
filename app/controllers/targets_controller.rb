class TargetsController < ApplicationController
  before_action :move_to_edit, only: [:new, :create]

  def edit
    @target_budget = TargetBudget.new
    if current_user.target == nil
      render :new
    end
    @user = current_user
  end

  def new
    @target_budget = TargetBudget.new
  end

  def destroy
    @target_budget = TargetBudget.new
    target = Target.find(params[:id])
    target.destroy
    render :new
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

  def move_to_edit
    unless current_user.target == nil
      redirect_to edit_target_path
    end
  end
end
