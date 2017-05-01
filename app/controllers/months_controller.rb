require 'open-uri'

class MonthsController < ApplicationController
  def index
    @current_month = Month.find_by current: true
    @prior_months = Month.where(current: :false)
  end

  def new
    date = Time.new

    @current_month = date.month
    @year = date.year
    @year_range = []
    
    for i in 2000..2035
      @year_range << [i, i]
    end
  end

  def create
    month = Month.create(name: params[:name],
                         year: params[:year],
                         current: params[:current])

    redirect_to "/months/#{month.id}"
  end

  def archive
    current_month = Month.find(params[:month_id])
    current_month.update(current: false)

    current_month.name == 'December' ? year = (current_month.year.to_i + 1) : year = current_month.year

    new_month = Month.create(name: current_month.next_month,
                             year: year,
                             current: true)

    Total.create(month_id: params[:month_id],
                 savings: params[:savings],
                 bills: params[:bills],
                 groceries: params[:groceries],
                 intoxicants: params[:intoxicants],
                 transportation: params[:transportation],
                 pets: params[:pets],
                 misc: params[:misc],
                 income: params[:income],
                 entertainment: params[:entertainment],
                 restaurants: params[:restaurants])


    redirect_to "/months/#{new_month.id}"
  end

  def show
    @month = Month.find(params[:id])

    @total = Total.find_by month_id: @month.id
    entries = @month.filter

    @bills = entries['bills']
    @total_bills = @month.total(@bills)
    @income = entries['income']
    @total_income = @month.total(@income)
    @groceries = entries['groceries']
    @total_groceries = @month.total(@groceries)
    @intox = entries['intoxicants']
    @total_intox = @month.total(@intox)
    @transport = entries['transportation']
    @total_transport = @month.total(@transport)
    @pets = entries['pets']
    @total_pets = @month.total(@pets)
    @restaurants = entries['restaurants']
    @total_restaurants = @month.total(@restaurants)
    @bme = entries['entertainment']
    @total_bme = @month.total(@bme)
    @misc = entries['miscellaneous']
    @total_misc = @month.total(@misc)
    @savings = entries['savings']
    @total_savings = @month.total(@savings)

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
