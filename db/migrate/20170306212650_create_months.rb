class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.string :name
      t.integer :year
      t.boolean :current

      t.timestamps
    end
  end
end
