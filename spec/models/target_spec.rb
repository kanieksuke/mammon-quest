require 'rails_helper'

RSpec.describe Target, type: :model do
  before do
    @target = FactoryBot.build(:target)
  end

  describe '目標設定' do
    context '目標データが保存される場合' do
      it '目標金額、目標期日を適正に入力すれば保存される' do
        expect(@target).to be_valid
      end
    end
    context '目標データが保存されない場合' do
      it 'target_amountが空だと保存されない' do
        @target.target_amount = nil
        @target.valid?
        expect(@target.errors.full_messages).to include("Target amount can't be blank")
      end
      it 'target_amountが半角数字でないと保存されない' do
        @target.target_amount = '３０００００'
        @target.valid?
        expect(@target.errors.full_messages).to include("Target amount is not a number")
      end
      it 'target_amountが0だと保存されない' do
        @target.target_amount = 0
        @target.valid?
        expect(@target.errors.full_messages).to include("Target amount must be greater than or equal to 1")
      end
      it 'target_dateが空だと保存されない' do
        @target.target_date = nil
        @target.valid?
        expect(@target.errors.full_messages).to include("Target date can't be blank")
      end
      it 'target_dateが半角数字でないと保存されない' do
        @target.target_date = 'hoge'
        @target.valid?
        expect(@target.errors.full_messages).to include("Target date is not a number")
      end
      it 'target_dateが0だと保存されない' do
        @target.target_date = 0
        @target.valid?
        expect(@target.errors.full_messages).to include("Target date must be greater than or equal to 1")
      end
      it 'current_amountが空だと保存されない' do
        @target.current_amount = nil
        @target.valid?
        expect(@target.errors.full_messages).to include("Current amount can't be blank")
      end
      it 'current_amountが半角数字でないと保存されない' do
        @target.current_amount = '３０００００'
        @target.valid?
        expect(@target.errors.full_messages).to include("Current amount is not a number")
      end
      it 'current_dateが空だと保存されない' do
        @target.current_date = nil
        @target.valid?
        expect(@target.errors.full_messages).to include("Current date can't be blank")
      end
      it 'current_dateが半角数字でないと保存されない' do
        @target.current_date = 'hoge'
        @target.valid?
        expect(@target.errors.full_messages).to include("Current date is not a number")
      end
      it 'ユーザーが紐付いていないと保存されない' do
        @target.user = nil
        @target.valid?
        expect(@target.errors.full_messages).to include('User must exist')
      end
    end
  end
end
