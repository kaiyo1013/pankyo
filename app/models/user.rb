class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        has_many :posts, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :liked_posts, through: :likes, source: :post
        has_many :comments, dependent: :destroy
        validates :name, presence: true #追記
        validates :profile, length: { maximum: 200 } #追記

        mount_uploader :image, ImageUploader


  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  
end
