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
  end

  def update
  end

  def destroy
  end
end
