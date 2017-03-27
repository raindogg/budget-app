class AddIncomeToTotal < ActiveRecord::Migration[5.0]
  def change
    add_column :totals, :income, :decimal
  end
end
