class User < ActiveRecord::Base
 has_secure_password
 has_and_belongs_to_many :liked_posts, class_name: "Post"
 has_many :posts, dependent: :destroy
 has_many :likes

 validates :user_name, presence: true, uniqueness: true
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, uniqueness: true,
 format: { with: VALID_EMAIL_REGEX }
 validates :password, length: { in: 4..10 }, allow_blank:true
end
