class HomeController < ApplicationController

  def homepage
    if current_user
      @user = current_user
      case @user.privilege
        when 0
          render 'home/fullAdminP0'
        when 1
          render 'home/adminP1'
        when 2
          render 'home/writeableUserP2'
        when 3
          render 'home/readableUserP3'
        else
          flash.now.alert = "User with undefined permission!"
          render "index"
      end
    else
      render 'index'
    end

  end

end
