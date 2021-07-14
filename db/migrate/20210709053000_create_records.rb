class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.decimal    :weight, null: false, precision: 5, scale: 2
      t.decimal    :body_fat, precision: 4, scale: 2
      t.text       :memo
      t.string     :assessment, null: false
      t.date       :input_day, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
