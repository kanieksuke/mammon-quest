class TargetsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new, only: [:index]
  def index
    @user = User.find(params[:id])
  end

  def new
    @target_budget = TargetBudget.new
  end

  def create
    @target_budget = TargetBudget.new(target_params)
    target_budget_params_addition
    if @target_budget.valid?
      @target_budget.save
      redirect_to root_path(@target_budget)
    else
      render :new
    end
  end

  private
  def move_to_new
    if @target_budget == nil
       redirect_to new_target_path
    end
  end

  def target_params
    params.require(:target_budget).permit(:target_amount, :target_date, :income, :fixed_cost).merge(user_id: current_user.id)
  end

  def target_budget_params_addition
    @target_budget.current_amount = @target_budget.target_amount
    @target_budget.current_date = 0
    d = Date.new(Time.now.year, Time.now.month, -1).day
    if @target_budget.income =! nil && @target_budget.fixed_cost =! nil
      @target_budget.income = params[:income].to_i
      @target_budget.fixed_cost = params[:fixed_cost].to_i  
      @target_budget.attack = ( @target_budget.income - @target_budget.fixed_cost ) / d
    else
      @target_budget.attack = 0
    end
    @target_budget.resist = 0
  end
end
