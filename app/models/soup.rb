class Soup < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
