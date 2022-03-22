require 'rails_helper'

RSpec.describe TargetBudget, type: :model do
  before do
    user = FactoryBot.create(:user)
    @target_budget = FactoryBot.build(:target_budget, user_id: user.id)
  end

  describe '目標設定' do
    context '目標データが保存される場合' do
      it '目標金額、目標期日を適正に入力すれば保存される' do
        expect(@target_budget).to be_valid
      end
    end
    context '目標データが保存されない場合' do
      it 'target_amountが空だと保存されない' do
        @target_budget.target_amount = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Target amount can't be blank")
      end
      it 'target_amountが半角数字でないと保存されない' do
        @target_budget.target_amount = '３０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Target amount is not a number")
      end
      it 'target_amountが0以下だと保存されない' do
        @target_budget.target_amount = 0
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Target amount must be greater than or equal to 1")
      end
      it 'target_dateが空だと保存されない' do
        @target_budget.target_date = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Target date can't be blank")
      end
      it 'target_dateが半角数字でないと保存されない' do
        @target_budget.target_date = 'hoge'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Target date is not a number")
      end
      it 'target_dateが0以下だと保存されない' do
        @target_budget.target_date = 0
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Target date must be greater than or equal to 1")
      end
      it 'current_amountが空だと保存されない' do
        @target_budget.current_amount = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current amount can't be blank")
      end
      it 'current_amountが半角数字でないと保存されない' do
        @target_budget.current_amount = '３０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current amount is not a number")
      end
      it 'current_dateが空だと保存されない' do
        @target_budget.current_date = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current date can't be blank")
      end
      it 'current_dateが半角数字でないと保存されない' do
        @target_budget.current_date = 'hoge'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current date is not a number")
      end
      it 'incomeが空だと保存されない' do
        @target_budget.income = ''
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Income can't be blank")
      end
      it 'incomeが半角数字でないと保存されない' do
        @target_budget.income = '１０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Income is not a number")
      end
      it 'fixed_costが空だと保存されない' do
        @target_budget.fixed_cost = ''
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Fixed cost can't be blank")
      end
      it 'fixed_costが半角数字でないと保存されない' do
        @target_budget.fixed_cost = '１０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Fixed cost is not a number")
      end
      it 'ユーザーが紐付いていないと保存されない' do
        @target_budget.user_id = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
