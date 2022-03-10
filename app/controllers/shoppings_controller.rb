class ShoppingsController < ApplicationController

  def create
    @shopping = Shopping.create(shopping_params)
    redirect_to edit_target_path(@shopping.id)
  end

  def update
  end

  private
  def shopping_params
    params.require(:shopping).permit(:resist).merge(target_id: params[:target_id])
  end
end
