class Comment < ApplicationRecord

  belongs_to :trip
  belongs_to :post

end
