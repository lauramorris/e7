# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private

  def current_user
    @current_user ||= (
      if !!session[:user_id]
        begin
          u = User.find(session[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          session[:user_id] = nil
        end
      end
      u)
  end
end
