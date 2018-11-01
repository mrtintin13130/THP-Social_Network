class HomeController < ApplicationController
  def index
  	@gossip = Gossip.all.order(updated_at: :desc)

    if session[:user_id] 
      @current_user = User.find(session[:user_id])
    end
  end

  def login
  	@user = User.new
  end

  def check
    @current_user = User.where(email: params[:user][:email], password: params[:user][:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      puts 'connected'
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/"
    else
      puts 'error'
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/login"
    end
  end

  def logout
    session.clear
    redirect_to "/"
  end
end