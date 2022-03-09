class TargetsController < ApplicationController
  before_action :move_to_edit, only: [:new, :create]
  before_action :error_breaker, only: [:edit, :new, :destroy, :update]

  def edit
    @target = Target.find(params[:id])
    create_attack
  end

  def new
  end

  def destroy
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
    if current_user.target == nil
      redirect_to new_target_path
    end
    @targets = Target.includes(:user).order("created_at DESC")
  end

  def update
    @target = Target.find(params[:id])
    create_attack
    @target.current_amount -= @attack
    @target.current_date += 1
    @target.save
    if @target.current_amount < 0 || @target.current_date == @target.target_date
      @target.destroy
      render :new
    else
      redirect_to edit_target_path
    end
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

  def create_attack
    d = Date.new(Time.now.year, Time.now.month, -1).day
    @attack = (@target.budget.income - @target.budget.fixed_cost) / d
  end

  def error_breaker
    @target_budget = TargetBudget.new
  end
end
