class ArtistsController < ApplicationController
 def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
        @artist.build_song
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to artists_path
        else
            @artist.build_song
            render :new
        end
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :type, :writer, :song_id, song_attributes: [:title])
    end
end