class TargetsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new, only: [:index]
  def index
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @target = Target.new(target_params)
    @budget = Budget.new(budget_params)
    target_budget_params_addition
    if @target.save && @budget.save
      redirect_to new_target_budget_path(@target)
    else
      render :new
    end
  end

  private
  def move_to_new
    if @target == nil
       redirect_to new_target_path
    end
  end

  def target_params
    params.require(:target).permit(:target_amount, :target_date).merge(user_id: current_user.id)
  end

  def budget_params
    params.require(:budget).permit(:income, :fixed_cost).merge(user_id: current_user.id, target_id: params[:target_id])
  end

  def target_budget_params_addition
    @target.current_amount = @target.target_amount
    @target.current_date = 0
    d = Date.new(Time.now.year, Time.now.month, -1).day
    if @budget.income =! nil && @budget.fixed_cost =! nil
      @budget.attack = (@budget.income - @budget.fixed_cost) / d
    else
      @budget.attack = 0
    end
    @budget.resist = 0
  end
end
