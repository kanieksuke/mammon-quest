class TargetsController < ApplicationController
  def index
  end

  def new
    @target = Target.new
end
