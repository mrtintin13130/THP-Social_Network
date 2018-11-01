class GossipController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(user_id: session[:user_id], content: params[:content], title: params[:title])
    @gossip.save
    redirect_to "/"
  end
end