class TargetsController < ApplicationController
  before_action :move_to_new, only: [:edit, :destroy, :index, :update]
  before_action :move_to_index, only: [:new, :create]
  before_action :error_breaker, only: [:edit, :new, :destroy, :update]

  def edit
    @target = Target.find(params[:id])
    @budget = @target.budget
    @shopping = @target.shopping
    @messages = @target.messages.includes(:target).order("created_at DESC")
    create_attack
  end

  def new
  end

  def destroy
    target = Target.find(params[:id])
    target.destroy
    render :new
  end

  def create
    @target_budget = TargetBudget.new(target_params)
    target_budget_params_addition
    if @target_budget.valid?
      @target_budget.save
      redirect_to targets_path
    else
      render :new
    end
  end

  def index
    @targets = Target.includes(:user).order("targets.created_at DESC")
    create_d
  end

  def update
    require 'date'
    @target = Target.find(params[:id])
    if @target.attack_date == Date.today
      Message.create(text: "攻撃ができるのは一日一回までです", target_id: @target.id)
      redirect_to edit_target_path(@target.id) and return
    end
    @budget = @target.budget
    @shopping = @target.shopping
    create_attack
    @target.current_amount -= @attack
    @target.current_date += 1
    if @target.current_amount <= 0
      Message.create(text: "あなたは欲望に打ち克ち、目標を達成しました! おめでとう!!", target_id: @target.id)
      Message.create(text: "マモンをやっつけた!", target_id: @target.id)
    elsif @target.target_date == @target.current_date
      Message.create(text: "欲望に負けてしまった...", target_id: @target.id)
      Message.create(text: "邪悪なオーラがあたりを包み込む!!", target_id: @target.id)
      Message.create(text: "マモンはオーラを解き放った!!", target_id: @target.id)
    elsif @target.target_date - @target.current_date == 1 
      Message.create(text: "マモンを覆うオーラが今にも解き放たれようとしている...!!", target_id: @target.id)
    elsif @target.target_date - @target.current_date == 2
      Message.create(text: "マモンを覆うオーラがどんどん膨れ上がっていく...!!", target_id: @target.id)
    elsif @target.target_date - @target.current_date == 3
      Message.create(text: "マモンの魔力が邪悪なオーラへと変わり、マモンを覆っていく...!!", target_id: @target.id)
    end
    if @attack < @shopping.resist
      Message.create(text: "マモンのHPが#{@shopping.resist-@attack}上がってしまった...!!", target_id: @target.id)
    end
    unless @target.current_amount <= 0
      if @target.current_date == 1
        Message.create(text: "なんとマモンに魔力が集まり出した!!", target_id: @target.id)
        Message.create(text: "マモンは寝ている...", target_id: @target.id)
      else
        Message.create(text: "マモンは魔力を溜めている...!!", target_id: @target.id)
      end
    end
    if @attack > @shopping.resist
      Message.create(text: "マモンに#{@attack}のダメージ!!", target_id: @target.id)
    else
      Message.create(text: "マモンにダメージを与えられませんでした...", target_id: @target.id)
    end
    Message.create(text: Date.today, target_id: @target.id)
    @target.shopping.resist = 0
    @target.attack_date = Date.today
    @target.save
    @shopping.save
    if @target.current_amount < 0 || @target.current_date == @target.target_date
      redirect_to target_path(@target.id)
    elsif Date.today == Date.new(Time.now.year, Time.now.month, -1).day
      redirect_to edit_target_budget_path(@budget.id)
    else
      redirect_to edit_target_path(@target.id)
    end
  end

  def show
    @target = Target.find(params[:id])
    @messages = @target.messages.includes(:target).order("created_at DESC")
  end

  private

  def target_params
    params.require(:target_budget).permit(:target_amount, :target_date, :income, :fixed_cost).merge(user_id: current_user.id)
  end

  def target_budget_params_addition
    @target_budget.current_amount = @target_budget.target_amount
    @target_budget.current_date = 0
    @target_budget.resist = 0
  end

  def move_to_index
    unless current_user.target == nil
      redirect_to root_path(current_user.target)
    end
  end

  def move_to_new
    if current_user.target == nil
      redirect_to new_target_path
    end
  end

  def create_attack
    d = Date.new(Time.now.year, Time.now.month, -1).day
    @attack = (@target.budget.income - @target.budget.fixed_cost) / d - @target.shopping.resist
  end

  def create_d
    @d = Date.new(Time.now.year, Time.now.month, -1).day
  end

  def error_breaker
    @target_budget = TargetBudget.new
  end
end
