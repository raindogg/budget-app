require 'open-uri'

class MonthsController < ApplicationController
  def index
    @current_month = Month.find_by current: true
    @prior_months = Month.where(current: :false)
  end

  def new
  end

  def create
  end

  def show
    @month = Month.find(params[:id])
    entries = @month.filter
    @bills = entries['bills']
    @income = entries['income']
    @groceries = entries['groceries']
    @intox = entries['intoxicants']
    @transport = entries['transportation']
    @pets = entries['pets']
    @restaurants = entries['restaurants']
    @bme = entries['entertainment']
    @misc = entries['miscellaneous']
    @savings = entries['savings']
    @expenses = @month.all_expenses(entries)
    @balance = @month.total(@income) - @expenses
    averages = Total.find_average
    @average_bills = averages['bills'].round(2)
    @average_income = averages['income'].round(2)
    @average_groceries = averages['groceries'].round(2)
    @average_intoxicants = averages['intoxicants'].round(2)
    @average_transportation = averages['transportation'].round(2)
    @average_pets = averages['pets'].round(2)
    @average_restaurants = averages['restaurants'].round(2)
    @average_entertainment = averages['entertainment'].round(2)
    @average_miscellaneous = averages['miscellaneous'].round(2)
    @average_savings = averages['savings'].round(2)

  end

  def update
  end

  def destroy
  end
end
