class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    # @temp = Song.new(s_params)
    @song = Song.create(s_params)
    # binding.pry
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(s_params)
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end


  private

  def s_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
