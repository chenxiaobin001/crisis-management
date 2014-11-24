class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:pennkey], params[:password])
    if user
      session[:user_id] = user.id
      case user.level
        when 1
          redirect_to "/document/readonly", :notice => "Logged in!"
        when 2
          redirect_to "/document/writeable", :notice => "Logged in!"
        when 3
          redirect_to "/document/admin", :notice => "Logged in!"
        else
          flash.now.alert = "User with undefined permission!"
          render "new"
      end
    else
      flash.now[:alert] = "Invalid pennkey or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  # def show
#     
  # end
#   

end
