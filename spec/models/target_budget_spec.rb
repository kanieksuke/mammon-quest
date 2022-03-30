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
        expect(@target_budget.errors.full_messages).to include("目標額を入力してください")
      end
      it 'target_amountが半角数字でないと保存されない' do
        @target_budget.target_amount = '３０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("目標額は数値で入力してください")
      end
      it 'target_amountが0以下だと保存されない' do
        @target_budget.target_amount = 0
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("目標額は1以上の値にしてください")
      end
      it 'target_dateが空だと保存されない' do
        @target_budget.target_date = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("目標期日を入力してください")
      end
      it 'target_dateが半角数字でないと保存されない' do
        @target_budget.target_date = 'hoge'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("目標期日は明日以降に設定してください")
      end
      it 'target_dateが0以下だと保存されない' do
        @target_budget.target_date = 0
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("目標期日は明日以降に設定してください")
      end
      it 'current_amountが空だと保存されない' do
        @target_budget.current_amount = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current amountを入力してください")
      end
      it 'current_amountが半角数字でないと保存されない' do
        @target_budget.current_amount = '３０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current amountは数値で入力してください")
      end
      it 'current_dateが空だと保存されない' do
        @target_budget.current_date = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current dateを入力してください")
      end
      it 'current_dateが半角数字でないと保存されない' do
        @target_budget.current_date = 'hoge'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Current dateは数値で入力してください")
      end
      it 'incomeが空だと保存されない' do
        @target_budget.income = ''
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("収入金額を入力してください")
      end
      it 'incomeが半角数字でないと保存されない' do
        @target_budget.income = '１０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("収入金額は数値で入力してください")
      end
      it 'fixed_costが空だと保存されない' do
        @target_budget.fixed_cost = ''
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("固定費を入力してください")
      end
      it 'fixed_costが半角数字でないと保存されない' do
        @target_budget.fixed_cost = '１０００００'
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("固定費は数値で入力してください")
      end
      it 'ユーザーが紐付いていないと保存されない' do
        @target_budget.user_id = nil
        @target_budget.valid?
        expect(@target_budget.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
