class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :description, presence: true

end
