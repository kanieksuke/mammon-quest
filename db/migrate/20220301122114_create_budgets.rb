class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.integer :income, null: false
      t.integer :fixed_cost, null: false
      t.integer :target_id
      t.timestamps
    end
  end
end
