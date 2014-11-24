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

    user = User.authenticate(pennkey, password)

    if user
      session[:user_id] = user.pennkey
  #    flash[:notice] = 'Welcome.' + pennkey.to_s
      redirect_to :root
    else
      flash[:error] = 'Unknown user. Please check your username and password.'
      redirect_to action: :sign_in
    end
  end
end
