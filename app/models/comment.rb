class Comment < ApplicationRecord
    validates :author, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    
    belongs_to :recipe 
end