class Review < ApplicationRecord
  #画像を表示する記述
   has_one_attached :image

   #GoogleMapの住所入力
   geocoded_by :address
   after_validation :geocode

   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   # customerとreviewは1対多の関係
   belongs_to :customer
   # typeとreviewは1対多の関係
   belongs_to :type
   # soupとreviewは1対多の関係
   belongs_to :soup

   #バリデーション
   validates :name,presence: true
   validates :address,presence: true
   validates :menu,presence: true
   validates :image,presence: true
   validates :type_id,presence: true
   validates :soup_id,presence: true
   validates :introduction,presence: true

   def favorited_by?(customer)
     favorites.where(customer_id: customer.id).exists?
   end

end


 # ユーザのアイコン画像アップロードに対してのバリデーション(.jpg .jpeg .pngのみ許可)
# private

# def illust_image_type
 # if illust_image.blob
 #  if !illust_image.blob.content_type.in?(%('image/jpeg image/jpg image/png'))
 #    errors.add(:illust_image, 'はjpeg、jpgまたはpng形式でアップロードしてください')
 #  end
 # end
# end
