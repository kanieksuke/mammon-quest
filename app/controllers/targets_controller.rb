class TargetsController < ApplicationController
  before_action :move_to_new
  def index
  end

  def new
    @target = Target.new
  end

  private
  def move_to_new
    if @target == nil
      render new_target_path
    end
  end
end
