class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.decimal :goal_weight, precision: 5, scale: 2, null: false
      t.integer :period_id, null: false
      t.text :plan, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
