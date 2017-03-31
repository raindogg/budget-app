require 'csv'
class Entry < ApplicationRecord
  belongs_to :month
  belongs_to :category

  def self.import(file)
    content = []
    CSV.foreach(file.path, headers: :true) do |row|
      content << row.to_h
    end
    content
  end
end
