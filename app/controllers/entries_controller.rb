require 'csv'

class EntriesController < ApplicationController
  def import
    @content = Entry.import(params[:sheet])
    @month = params[:month_id]
  end

  def create
    entry = Entry.create(name: params[:name],
                         amount: params[:amount],
                         month_id: params[:month_id],
                         category_id: params[:category][:category_id])

    redirect_to "/months/#{params[:month_id]}"
  end

  def show
  end

  def update
  end

  def destroy
  end
end
