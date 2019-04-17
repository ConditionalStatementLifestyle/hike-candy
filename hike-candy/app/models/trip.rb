class Trip < ApplicationRecord

  belongs_to :user
  has_many :comments, as: :commentable

  def author
    trip_owner = User.find(self.user_id)
    "#{trip_owner.first_name} #{trip_owner.last_name}"
  end

end
