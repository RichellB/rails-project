class SongController < ApplicationController

get '/songs' do
    if is_logged_in?
      @songs = Song.all
      erb :'/songs/all_songs'
    else
      redirect to '/sessions/login'
    end
  end

  get '/songs/new' do
    if is_logged_in?
      erb :'songs/new'
    else
      redirect to '/sessions/login'
    end
  end
  
   post '/songs' do
    if is_logged_in?
      if params[:title] == ""
        redirect to "/songs/new"
      else
        song = current_user.songs.build(title: params[:title], album_name: params[:album_name])
        if song.save
          redirect to "/songs"
        end
      end
    end
  end

  get '/songs/:id' do
    if is_logged_in?
      @song = Song.find_by_id(params[:id])
      erb :"songs/show"
    end
  end

  get '/songs/:id/edit' do
    if is_logged_in?
      @artists = Artist.all
      @song = Song.find_by_id(params[:id])
      if @song && @song.artist == current_user
        erb :'songs/edit'
      else
        redirect to '/songs'
      end
    else
      redirect to '/sessions/login'
    end
  end

  patch '/songs/:id' do
    if is_logged_in?
      if params[:title] == ""
        redirect to "/songs/#{params[:id]}/edit"
      else
        @song = Song.find_by_id(params[:id])
        if @song && @song.artist == current_user
          if @song.update(title: params[:title])
            redirect to "/songs/#{@song.id}"
          else
            redirect to "/songs/#{@song.id}/edit"
          end
        else
          redirect to '/songs'
        end
      end
    else
      redirect to '/sessions/login'
    end
  end

  delete '/songs/:id' do
    if is_logged_in?
      @song = Song.find_by_id(params[:id])
      if @song && @song.artist == current_user
        @song.delete
      end
      redirect to '/songs'
    else
      redirect to '/sessions/login'
    end
  end
end