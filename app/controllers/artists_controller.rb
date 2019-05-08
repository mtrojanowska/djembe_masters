class ArtistsController < ApplicationController

  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show; end

  def new
    @artist = Artist.new
  end

  def edit; end

  def create
    @artist = Artist.new(artist_params)
      if @artist.save
        flash[:notice] = "Artist has been successfully created"
        redirect_to @artist
      else
        flash[:notice] = "Try again to create an artist"
        render 'new'
      end
  end

  def update
    if @artist.update(artist_params)
      flash[:notice] = "You successfully updated the artist"
      redirect_to @artist
    else
      flash[:warning] = "Try again to update the artist"
      render 'new'
    end
  end

  def destroy
    @artist.destroy
    flash[:notice] = "Artist was successfully destroyed"
    redirect_to artists_path
  end
end

private
  def artist_params
    params.require(:artist).permit(:nickname, :birthdate, :origin, :biography)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
