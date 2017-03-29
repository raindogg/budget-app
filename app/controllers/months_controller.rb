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
  end

  def update
  end

  def destroy
  end
end
