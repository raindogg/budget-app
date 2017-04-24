class Month < ApplicationRecord
  has_many :entries
  has_one :total

  def filter
    filtered_entries = { 'bills' => [],
                         'income' => [],
                         'groceries' => [],
                         'intoxicants' => [],
                         'transportation' => [],
                         'pets' => [],
                         'restaurants' => [],
                         'entertainment' => [],
                         'miscellaneous' => [],
                         'savings' => [] }
    entries.each do |entry|
      filtered_entries['bills'] << [entry.name, entry.amount, entry.id] if entry.category_id == 1
      filtered_entries['income'] << [entry.name, entry.amount, entry.id] if entry.category_id == 2
      filtered_entries['groceries'] << [entry.name, entry.amount, entry.id] if entry.category_id == 3
      filtered_entries['intoxicants'] << [entry.name, entry.amount, entry.id] if entry.category_id == 4
      filtered_entries['transportation'] << [entry.name, entry.amount, entry.id] if entry.category_id == 5
      filtered_entries['pets'] << [entry.name, entry.amount, entry.id] if entry.category_id == 6
      filtered_entries['restaurants'] << [entry.name, entry.amount, entry.id] if entry.category_id == 7
      filtered_entries['entertainment'] << [entry.name, entry.amount, entry.id] if entry.category_id == 8
      filtered_entries['miscellaneous'] << [entry.name, entry.amount, entry.id] if entry.category_id == 9
      filtered_entries['savings'] << [entry.name, entry.amount, entry.id] if entry.category_id == 10
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
    everything.delete('income')
    sum = 0
    everything.each_value do |entry|
      sum += total(entry)
    end
    sum
  end

  def next_month
    months = ['January', 'February', 'March', 'April', 'May', 'June',
              'July', 'August', 'September', 'October', 'November', 'December']

    month_index = months.index(name)

    if month_index == 11
      return months[0]
    else
      return months[month_index + 1]
    end
  end
end
