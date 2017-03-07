class AddMonthIdToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :month_id, :integer
  end
end
