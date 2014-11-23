class AuthenticationController < ApplicationController

  def sign_in
    @user = User.new
  end

  def signed_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
    redirect_to :root
  end

  def login
    pennkey = params[:user][:pennkey]
    password = params[:user][:password]

    User.authenticate(username, password)
      username = username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end

end
