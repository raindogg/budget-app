class CreateTotals < ActiveRecord::Migration[5.0]
  def change
    create_table :totals do |t|
      t.decimal :savings
      t.decimal :bills
      t.decimal :groceries
      t.decimal :intoxicants
      t.decimal :transportation
      t.decimal :pets
      t.decimal :misc
      t.integer :month_id

      t.timestamps
    end
  end
end
