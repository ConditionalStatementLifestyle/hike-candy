class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user


  def self.post_comments
    self.all.select {|comment| comment.commentable_type == "Post"}
  end

  def self.trip_comments
    self.all.select {|comment| comment.commentable_type == "Trip"}
  end

end
