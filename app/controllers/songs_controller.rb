class SongsController < ApplicationController


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end
  def show
    @song = Song.find(params[:id])
    #code
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    # @songs = Song.all
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
    #code
  end

  private

  def song_params
    params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name)
  end


end
