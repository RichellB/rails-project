class SongsController < ApplicationController

  def index
        if @artist = Artist.find_by_id(params[:artist_id])
            @songs = @artist.songs.all
        else
            @songs = Song.all
        end   

    end

    def new
        if @artist = Artist.find_by_id(params[:artist_id])
            @song = @artist.songs.build
        else
            @song = Song.new
        end    
    end

    def create
        @song = current_user.songs.build(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
        @song = Song.find_by_id(params[:id])
    end

    private
    
    def song_params
        params.require(:song).permit(:title, :album_name, :artist, :release_year, :genre)
    end
end