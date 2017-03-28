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
    @bills = entries[0]
    @income = entries[1]
    @groceries = entries[2]
    @intox = entries[3]
    @transport = entries[4]
    @pets = entries[5]
    @restaurants = entries[6]
    @bme = entries[7]
    @misc = entries[8]
    @savings = entries[9]
    @expenses = @month.all_expenses(entries)
    @balance = @month.total(@income) - @expenses
  end

  def update
  end

  def destroy
  end
end
