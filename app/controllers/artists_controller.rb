class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    @artist.songs.build(name: "Title", album: "Album")
  end

  def create
    Artist.create(artist_params)
    redirect_to artist_path
  end

  def artist_params
    params.require(:artist).permit(
      :title,
      songs_attributes: [ :name, :album ]
    )
  end
end
