class RelationshipsController < ApplicationController

  def index

    @user = User.find(params[:id])
    @following_relationships = @user.active_relationships
    @follower_relationships = @user.passive_relationships
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
    Relationship.create(follower_id: params[:follower_id], followed_id: params[:followed_id])
    redirect_back(fallback_location: root_path)
  end


  def destroy
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    @follow = @post.user

    @relation = Relationship.select do |r| r.follower_id == @user.id && r.followed_id == @follow.id end
    @relation[0].destroy
    redirect_back(fallback_location: root_path)
  end


end
