class Month < ApplicationRecord
  has_many :entries
  has_one :total

  def filter
    filtered_entries = [[], [], [], [], [], [], [], [], [], []]
    entries.each do |entry|
      filtered_entries[0] << [entry.name, entry.amount] if entry.category_id == 1
      filtered_entries[1] << [entry.name, entry.amount] if entry.category_id == 2
      filtered_entries[2] << [entry.name, entry.amount] if entry.category_id == 3
      filtered_entries[3] << [entry.name, entry.amount] if entry.category_id == 4
      filtered_entries[4] << [entry.name, entry.amount] if entry.category_id == 5
      filtered_entries[5] << [entry.name, entry.amount] if entry.category_id == 6
      filtered_entries[6] << [entry.name, entry.amount] if entry.category_id == 7
      filtered_entries[7] << [entry.name, entry.amount] if entry.category_id == 8
      filtered_entries[8] << [entry.name, entry.amount] if entry.category_id == 9
      filtered_entries[9] << [entry.name, entry.amount] if entry.category_id == 10
    end
    filtered_entries
  end

  def total(expenses)
    sum = 0
    expenses.each do |expense|
      sum += expense[1]
    end
    sum
  end

  def all_expenses(everything)
    everything.delete_at(1)
    sum = 0
    everything.each do |entry|
      sum += total(entry)
    end
    sum
  end
end
