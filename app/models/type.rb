class Type < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
end
