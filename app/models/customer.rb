class Customer < ApplicationRecord
  #画像を表示する記述
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  #バリデーション
   validates :name,presence: true
   validates :email,presence: true
  # validates :sex,presence: true
  # validates :birth_year,presence: true
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  #ゲストログイン
    def self.guest
    find_or_create_by!(name: 'guestuser',email: 'guest@example.com',sex: '無回答',birth_year: '無回答') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
    end
    end

   #退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設けて
    def active_for_authentication?
     super && (is_deleted == false)
    end
end
