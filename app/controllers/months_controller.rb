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
    @bills = @month.filter('Bills')
    @groceries = @month.filter('Groceries')
    @intox = @month.filter('Intoxicants')
    @transport = @month.filter('Transportation')
    @pets = @month.filter('Pets')
    @restaurants = @month.filter('Restaurants')
    @bme = @month.filter('Bars, Movies, Entertainment')
    @misc = @month.filter('Miscellaneous')
    @savings = @month.filter('Savings')
    @income = @month.filter('Income')
    @balance = @month.total(@income) - @month.all_expenses
  end

  def update
  end

  def destroy
  end
end
