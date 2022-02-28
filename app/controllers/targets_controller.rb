class TargetsController < ApplicationController
  before_action :move_to_new, only: [:index]
  def index
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    target_params_addition
    if @target.save
      redirect_to new_target_budget_path(@target)
    else
      render :new
    end
  end

  private
  def move_to_new
    if @target == nil
      render new_target_path
    end
  end

  def target_params
    params.permit(:max_hp, :max_mp)
  end

  def target_params_addition
    @target.current_hp = @target.max_hp
    @target.current_mp = 0
  end
end
