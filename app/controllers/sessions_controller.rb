class SessionsController < ApplicationController 

  def createf
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render '/devise/sessions/new'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end