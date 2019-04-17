class RelationshipsController < ApplicationController

  def index
    @active_relationships = current_user.active_relationships
    @passive_relationships = current_user.passive_relationships
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
