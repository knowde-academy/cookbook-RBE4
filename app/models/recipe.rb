class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, :inclusion => 1..5
  validates :price, numericality: { greater_than: 0.0, less_than: 10**6 }, allow_nil: true
  
  # without it you can pass e.g. 1.12345 and it's casted and rounded by default
  validate :price_before_cast 
  
  private
  def price_before_cast
    # Regex is only matched against strings
    unless price_before_type_cast.to_s =~ /\A\d+(?:\.\d{0,2})?\z/
      errors.add('price', 'Price must match the correct format.')
    end
  end
end

