class GraphsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:category])
    id = @category.id.to_s
    totals = Total.all
    @values = []
    @months = []
    @goal = @category.goal.amount

    totals.each do |total|
      @months << { name: total.month.name,
                   year: total.month.year,
                   id: total.month.id }
      @values << total.find_total(id)
    end
  end
end
