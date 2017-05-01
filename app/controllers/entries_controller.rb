require 'csv'

class EntriesController < ApplicationController
  def import
    @content = Entry.import(params[:sheet])
    @month_id = params[:month_id]
  end

  def create
    Entry.create(name: params[:name],
                 amount: params[:amount],
                 month_id: params[:month_id],
                 category_id: params[:category][:category_id])

    redirect_to "/months/#{params[:month_id]}"
  end

  def createbulk
    @entry = Entry.create(name: params[:name],
                          amount: params[:amount],
                          month_id: params[:month_id],
                          category_id: params[:category_id])
  end

  def update
  end

  def destroy
    entry = Entry.find(params[:id])
    month = entry.month_id
    entry.destroy

    redirect_to "/months/#{month}"
  end
end
