class SessionsController < ApplicationController 
  
  get '/registration/signup' do
    erb :'/registration/signup'
  end

  post '/registration/signup' do
    if  params[:name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/registration/signup'
    else
      @artist = Artist.new(:name => params[:name], :email_address => params[:email_address], :username => params[:username], :password => params[:password])
      @artist.save
      session[:artist_id] = @artist.id
      redirect to '/account'
    end
    redirect to '/'
  end
	
	get '/sessions/login' do
		erb :'/sessions/login'
	end

  post '/sessions/login' do
    @artist = Artist.find_by(:username => params[:username])
    if @artist && @artist.authenticate(params[:password])
      session[:artist_id] = @artist.id
      redirect to '/account'
    end
      erb :errors
  end
  
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'sessions/login'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end
end