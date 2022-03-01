class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.integer :income, null: false
      t.integer :fixed_cost, null: false
      t.integer :attack, null: false
      t.integer :resist, null: false
      t.integer :target_id
      t.timestamps
    end
  end
end
