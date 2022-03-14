class AddTargetDateBaseToTargets < ActiveRecord::Migration[6.0]
  def change
    add_column :targets, :target_date_base, :date
  end
end
