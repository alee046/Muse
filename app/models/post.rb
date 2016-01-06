class Post < ActiveRecord::Base
  has_and_belongs_to_many :user_liked, class_name: "User"
  has_many :likes
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true

end
