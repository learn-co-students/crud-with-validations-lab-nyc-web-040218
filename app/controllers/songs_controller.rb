class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    def show
        @song = Song.find(params[:id])
    end
    def edit
        @song = Song.find(params[:id])
    end
    def new
        @song = Song.new
    end
    def create
        @song = Song.new(post_params(song_params))
        @song = Song.create(song_params)
    end

    private
        def post_params(*args)
            params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
        end
end
