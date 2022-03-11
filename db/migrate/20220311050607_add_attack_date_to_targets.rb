class AddAttackDateToTargets < ActiveRecord::Migration[6.0]
  def change
    add_column :targets, :attack_date, :date
  end
end
