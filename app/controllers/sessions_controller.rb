class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tickets_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to root_url
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end
end
