# post.rb
class Post < ApplicationRecord
  mount_uploader :image, AvatarUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
