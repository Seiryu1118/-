class Review < ApplicationRecord
  #画像を表示する記述
   has_one_attached :image
   
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   # customerとreviewは1対多の関係
   belongs_to :customer
   # typeとreviewは1対多の関係
   belongs_to :type
   # soupとreviewは1対多の関係
   belongs_to :soup
end
