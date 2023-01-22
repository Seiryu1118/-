class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :review

  validates :content, presence: true
end
