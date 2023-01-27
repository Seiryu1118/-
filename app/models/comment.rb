class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :review
  #バリデーション
  validates :content, presence: true
end
