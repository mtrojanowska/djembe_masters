class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

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
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      flash[:notice] = "You successfully updated the artist"
      redirect_to @artist
    else
      flash[:warning] = "Try again to update the artist"
      render 'new'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist was successfully destroyed"
    redirect_to artists_path
  end
end

private
  def artist_params
    params.require(:artist).permit(:nickname, :birthdate, :origin, :biography)
  end
