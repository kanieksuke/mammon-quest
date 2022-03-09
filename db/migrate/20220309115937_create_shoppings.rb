class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.integer :resist, null: false
      t.integer :target_id
      t.timestamps
    end
  end
end
