class SessionsController < ApplicationController
	
     layout "frontpage"
  def shownewuser
    @logged_in = 'yes'
    @title = "Sign in"
    @uid = params[:id]
    gon.your_object = User.find(params[:id])
  end
  
  
  def new
    @logged_in = 'yes'
    @title = "Sign in"
  end
  
  def create
  	  
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      response.headers['X-CSRF-Token'] = form_authenticity_token
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      @title = "Sign in"
      render "new"
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end 	  
  
end
