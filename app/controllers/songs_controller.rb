# frozen_string_literal: true

class SongsController < ApplicationController
  PER_PAGE = 3
  def index
    @songs = Song.order(released: :desc).page(params[:page]).per(3)
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      flash[:success] = 'The Song has been successfully crated'
      redirect_to @artist
    else
      flash[:danger] = 'Try again to create the song'
      render 'new'
    end
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    if @song.update(song_params)
      flash[:success] = 'The song was successfully updated'
      redirect_to @artist
    else
      flash[:danger] = 'Try again to update the song'
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    if @song.destroy
      flash[:success] = 'The song was sucessfully destroyed'
      redirect_to artist_path(@artist)
    else
      flash[:danger] = "The song wasn't destroyed"
      render @song
    end
  end
end

private
def song_params
  params.require(:song).permit(:title, :released, :duration)
end
