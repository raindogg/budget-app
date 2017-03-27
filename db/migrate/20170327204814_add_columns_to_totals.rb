class AddColumnsToTotals < ActiveRecord::Migration[5.0]
  def change
    add_column :totals, :entertainment, :decimal
    add_column :totals, :restaurants, :decimal
  end
end
