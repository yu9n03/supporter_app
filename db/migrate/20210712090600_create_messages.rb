class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :text,       null: false
      t.string :user_nickname, null: false
      t.integer :room_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
