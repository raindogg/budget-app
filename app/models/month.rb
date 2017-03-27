class Month < ApplicationRecord
  has_many :entries
  has_one :total

  def filter(name)
    filtered_entries = []
    entries.each do |entry|
      filtered_entries << entry if entry.category.name == name
    end
    filtered_entries
  end

  def total(entries)
    sum = 0
    entries.each do |entry|
      sum += entry.amount
    end
    sum
  end

  def all_expenses
    expenses = entries.all.reject { |entry| entry.category.name == 'Income' }
    total(expenses)
  end
end
