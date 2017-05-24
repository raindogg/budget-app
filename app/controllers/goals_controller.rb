class GoalsController < ApplicationController
  def index
    @goals = Goal.all.order(:id)

  end

  def new
    # @categories = Category.all - when I modify for additional users, I'l want
    # to customize this to select the cats for that user
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

  def create
    Goal.create(category_id: 1, amount: params[:bills])
    Goal.create(category_id: 2, amount: params[:income])
    Goal.create(category_id: 3, amount: params[:groceries])
    Goal.create(category_id: 4, amount: params[:intox])
    Goal.create(category_id: 5, amount: params[:transportation])
    Goal.create(category_id: 6, amount: params[:pets])
    Goal.create(category_id: 7, amount: params[:restaurants])
    Goal.create(category_id: 8, amount: params[:entertainment])
    Goal.create(category_id: 9, amount: params[:misc])
    Goal.create(category_id: 10, amount: params[:savings])

    redirect_to '/goals'
  end

  def update
    goal = Goal.find(params[:id])
    goal.update(amount: params[:amount])
  end
end
