class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: true

  has_many :trips
  has_many :posts

  has_many :comments

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed_user
  has_many :follower_users, through: :passive_relationships, source: :follower_user



  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
