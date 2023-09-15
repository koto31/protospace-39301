class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :prototype
  
  #validatable :user, presence: true
  validates :content, presence: true
end
