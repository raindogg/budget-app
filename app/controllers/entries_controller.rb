require 'csv'

class EntriesController < ApplicationController
  def import
    @content = Entry.import(params[:sheet])
    @month_id = params[:month_id]
  end

  def create
    entry = Entry.create(name: params[:name],
                         amount: params[:amount],
                         month_id: params[:month_id],
                         category_id: params[:category_id][:category])

    redirect_to "/months/#{params[:month_id]}"
  end

  def createbulk
    @entry = Entry.create(name: params[:name],
                          amount: params[:amount],
                          month_id: params[:month_id],
                          category_id: params[:category_id])
  end

  def show
  end

  def update
  end

  def destroy
  end
end
