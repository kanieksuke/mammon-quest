class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.integer :target_amount, null: false
      t.integer :target_date, null: false
      t.integer :current_amount, null: false
      t.integer :current_date, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
