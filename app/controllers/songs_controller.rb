require 'byebug'
class SongsController < ApplicationController
attr_reader :release_year
def new
  @song = Song.new
end

def create

  @song = Song.create(params.require(:song).permit(:artist_name, :released, :title, :release_year, :genre))
  a = @song.save
  if @song.valid?
    @song.save
    redirect_to song_path(@song)
  else
    render :new
  end
end

def edit
  @song = Song.find(params[:id])
end

def update
  @song = Song.find(params[:id])
  @song.update(params.require(:song).permit(:artist_name, :released, :title, :release_year, :genre))

  if @song.valid?
    redirect_to song_path(@song)
  else
    render :edit
  end
end

def index
  @songs = Song.all
end

def show
  @song = Song.find(params[:id])
end

def destroy
  @song = Song.find(params[:id])
  @song.destroy
  redirect_to songs_path

end



end
