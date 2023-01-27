class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :review
  #バリデーション
  validates_uniqueness_of :review_id, scope: :customer_id
end
