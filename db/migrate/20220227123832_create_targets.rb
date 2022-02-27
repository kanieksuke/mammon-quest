class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.integer :max_hp, null: false
      t.integer :max_mp, null: false
      t.integer :current_hp, null: false
      t.integer :current_mp, null: false
      t.timestamps
    end
  end
end
