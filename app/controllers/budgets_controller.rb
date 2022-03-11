class BudgetsController < ApplicationController
  def edit
    @budget = Budget.find(params[:id])
  end

  def update
  end
end
