class Rating < ApplicationRecord
    validates :author, presence: true
    validates :rating, presence: true, numericality: {
        only_integer: true,
        greater_than_or_equal_to: 1,
        less_than_or_equal_to: 5
    }

    belongs_to :recipe 
end
