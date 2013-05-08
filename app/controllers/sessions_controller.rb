# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first_or_initialize(
      :provider_email => auth["info"]["email"],
      :name => auth["info"]["name"],
    )
    url = session[:return_to] || root_path
    session[:return_to] = nil
    url = root_path if url.eql?('/logout')

    raise "Failed to login" unless !user.new_record? or user.save

    session[:user_id] = user.id
    notice = "Signed in!"
    logger.debug "URL to redirect to: #{url}"
    redirect_to url, :notice => notice
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
