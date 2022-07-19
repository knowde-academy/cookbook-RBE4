class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 10 }
  
  belongs_to :recipe 
  belongs_to :user
end
