class RelationshipsController < ApplicationController

  def index
    user = User.find(params[:id])
    @following_relationships = user.active_relationships
    @follower_relationships = user.passive_relationships
    @followingcount = @following_relationships.count
    @followercount = @follower_relationships.count

    @followingobjects = @following_relationships.map do |ar|
      User.find(ar.followed_id)
    end

    @followerobjects = @follower_relationships.map do |pr|
      User.find(pr.follower_id)
    end


  end

  def create
    @followed_user = User.find(params[:relationship][:followed_id])
    @relationship = current_user.active_relationships.new(followed_id: @followed_user.id)
    if @relationship.save
      flash[:message] = "Follow Success"
      #redirect?
    else
      flash[:message] = "Follow Unsuccessful"
      #redirect?
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.follower_user == current_user
      @relationship.destroy
      flash[:message] = "Unfollowed"
    end
    #redirect
  end


end
