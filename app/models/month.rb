class Month < ApplicationRecord
  has_many :entries

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

  def all_savings
    savings = filter('Savings')
    total(savings)
  end

  def all_bills
    bills = filter('Bills')
    total(bills)
  end

  def all_groceries
    groceries = filter('Groceries')
    total(groceries)
  end

  def all_intoxicants
    intoxicants = filter('Intoxicants')
    total(intoxicants)
  end

  def all_transportation
    transportation = filter('Transportation')
    total(transportation)
  end

  def all_pets
    pets = filter('Pets')
    total(pets)
  end

  def all_restaurants
    restaurants = filter('Restaurants')
    total(restaurants)
  end

  def all_bme
    bme = filter('Bars, Movies, Entertainment')
    total(bme)
  end

  def all_misc
    misc = filter('Miscellaneous')
    total(misc)
  end
end
