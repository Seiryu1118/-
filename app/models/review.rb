class Review < ApplicationRecord
  #画像を表示する記述
   has_one_attached :image
end
