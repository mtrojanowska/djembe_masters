# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :song_authorization, only: %i[edit update destroy]
  before_action :authenticate_artist!, except: [:index, :show]
  PER_PAGE = 3
  def index
    @songs = Song.order(released: :desc).page(params[:page]).per(PER_PAGE)

  end

  def show
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
    authorize @song
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def create
    @song = current_artist.songs.create(song_params)
    authorize @song
    if @song.save
      flash[:success] = 'The Song has been successfully crated'
      redirect_to current_artist
    else
      flash[:danger] = 'Try again to create the song'
      render 'new'
    end
  end

  def update
    # @artist = Artist.find(params[:artist_id])
    @song = current_artist.songs.find(params[:id])
    if @song.update(song_params)
      flash[:success] = 'The song was successfully updated'
      redirect_to current_artist
    else
      flash[:danger] = 'Try again to update the song'
      render 'edit'
    end
  end

  def destroy
    # @artist = Artist.find(params[:artist_id])
    @song = current_artist.songs.find(params[:id])
    if @song.destroy
      flash[:success] = 'The song was sucessfully destroyed'
      redirect_to current_artist
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

def song_authorization
  @song = Song.find(params[:id])
  authorize @song
end
