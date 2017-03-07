class AddCategoryIdToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :category_id, :integer
    drop_table :entry_categories
  end
end
