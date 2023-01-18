class Type < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  #バリデーション
   validates :name,presence: true
end
