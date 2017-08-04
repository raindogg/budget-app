class Total < ApplicationRecord
  belongs_to :month

  def self.find_average
    averages = { 'bills' => 0,
                 'income' => 0,
                 'groceries' => 0,
                 'intoxicants' => 0,
                 'transportation' => 0,
                 'pets' => 0,
                 'restaurants' => 0,
                 'entertainment' => 0,
                 'miscellaneous' => 0,
                 'savings' => 0 }

    all.each do |total|
      averages['bills'] += total.bills
      averages['income'] += total.income
      averages['groceries'] += total.groceries
      averages['intoxicants'] += total.intoxicants
      averages['transportation'] += total.transportation
      averages['pets'] += total.pets
      averages['restaurants'] += total.restaurants
      averages['entertainment'] += total.entertainment
      averages['miscellaneous'] += total.misc
      averages['savings'] += total.savings
    end
    averages.each { |key, value| averages[key] = value / Month.all.length }
    averages
  end

  def find_total
    values = {}
    values[:bills] = bills
    values[:income] = income
    values[:groceries] = groceries
    values[:intoxicants] = intoxicants
    values[:pets] = pets
    values[:restaurants] = restaurants
    values[:entertainment] = entertainment
    values[:miscellaneous] = misc
    values[:savings] = savings
    values
  end
end
