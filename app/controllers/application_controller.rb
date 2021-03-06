class ApplicationController < ActionController::Base
    before_action :authenticate_user!
      before_action :configure_permitted_parameters, if: :devise_controller?

 

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end


  def notifications_list
    p "heloo"
    @notifications = current_user.notifications.unopened_only
    @users = User.all
    redirect_to "/users/#{current_user.id}/notifications"  
  end

  def notifications_center

    @notifications = current_user.notifications
    @users = User.all
    redirect_to "/users/#{current_user.id}/notifications"  
  end
    
end
