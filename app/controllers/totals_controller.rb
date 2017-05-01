class TotalsController < ApplicationController
  def create
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

    redirect_to "/"
  end
end
