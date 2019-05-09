class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy ]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
      if @song.save
        flash[:notice] = "The Song has been successfully crated"
        redirect_to @song
      else
        flash[:notice] = "Try again to create the song"
        render 'new'
      end
  end

  def update
    if @song.update(song_params)
      flash[:success] = "The song was successfully updated"
      redirect_to @song
    else
      flash[:success] = "Try again to update the song"
      render 'new'
    end
  end

  def destroy
    if @song.destroy
      flash[:success] = "The song was sucessfully destroyed"
      redirect_to songs_path
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

  def find_song
    @song = Song.find(params[:id])
  end