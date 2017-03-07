class Entry < ApplicationRecord
  belongs_to :month
  has_many :entry_categories
  has_many :categories, though: :entry_categories
end
