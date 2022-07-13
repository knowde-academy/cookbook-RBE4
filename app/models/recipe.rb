class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, :inclusion => 1..5
 
end
