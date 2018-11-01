class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	if User.find_by(email: params[:user][:email]) == nil
  		@user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
    	@user.save
    	redirect_to "/"
    else
    	puts "error ! email already exist !"
    end
  end
end
