class RenameCatIdtoCategoryId < ActiveRecord::Migration[5.0]
  def change
    rename_column :goals, :cat_id, :category_id
  end
end
