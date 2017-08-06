class GraphsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = params[:category]
    category = @category.downcase.to_sym
    totals = Total.all
    @values = []
    @months = []

    test = Total.find(3).find_total
    @test = test[category]
    totals.each do |total|
      @months << total.month.name
      @values << total.find_total[category]
    end
  end
end
