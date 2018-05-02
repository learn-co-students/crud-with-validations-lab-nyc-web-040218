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
    @song = Song.new(post_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
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
    # @song.title = post_params(:title)[:title]
    # @song.released = post_params(:released)[:released]
    # @song.release_year = post_params(:release_year)[:release_year]
    # @song.artist_name = post_params(:artist_name)[:artist_name]
    # @song.genre = post_params(:genre)[:genre]
    # if @song.valid?
    #   @song.save
    if @song.update(post_params(:title, :released, :release_year, :artist_name, :genre))
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
  def post_params(*args)
    params.require(:song).permit(*args)
  end
end
