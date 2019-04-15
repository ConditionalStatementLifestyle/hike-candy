class User < ApplicationRecord

  has_many :trips
  has_many :posts
  has_many :comments, through: :trips
  has_many :comments, through: :posts
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followed_users, through: :active_relationships, source: :followed_user
  has_many :follower_users, through: :passive_relationships, source: :follower_user



end
