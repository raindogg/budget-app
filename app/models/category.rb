class Category < ApplicationRecord
  has_many :entries
  has_one :goal
end
