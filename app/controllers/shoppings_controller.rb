class ShoppingsController < ApplicationController

  def create
  end

  def update
    @target = Target.find(params[:id])
    @current_shopping = @target.shopping
    shopping = Shopping.new(shopping_params)
    @current_shopping.resist += shopping.resist
    @current_shopping.save
    shopping.destroy
    Message.create(text:"攻撃力が下がってしまった...", target_id: @target.id)
    redirect_to edit_target_path(@target.id)
  end

  private
  def shopping_params
    params.require(:shopping).permit(:resist).merge(target_id: params[:target_id])
  end
end
