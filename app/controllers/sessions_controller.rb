class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
    if user && user.password == (params[:session][:password])
    	log_in user
    	redirect_to user
		else
			flash.now[:danger] = "Something isn't right...check your username and password again."
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
