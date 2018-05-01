class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    #raise params.inspect
    @song = Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end
end
