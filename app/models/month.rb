class Month < ApplicationRecord
  has_many :entries

  def all_expenses
    sum = 0
    entries.each do |entry|
      sum += entry.amount
    end
    sum
  end

  def all_savings
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Savings'
    end
    sum
  end

  def all_bills
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Bills'
    end
    sum
  end

  def all_groceries
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Groceries'
    end
    sum
  end

  def all_intoxicants
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Intoxicants'
    end
    sum
  end

  def all_transportation
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Transportation'
    end
    sum
  end

  def all_pets
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Pets'
    end
    sum
  end

  def all_restaurants
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Restaurants'
    end
    sum
  end

  def all_bme
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Bars, Movies, Entertainment'
    end
    sum
  end

  def all_misc
    sum = 0
    entries.each do |entry|
      sum += entry.amount if entry.category.name == 'Miscellaneous'
    end
    sum
  end
end
