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
    def update
        @song = Song.find(params[:id])
        @song.assign_attributes(post_params(post_params))
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :edit
        end
    end
    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end
    def new
        @song = Song.new
    end
    def create
        # binding.pry
        @song = Song.new(post_params(post_params))
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :new
        end
        # @song = Song.create(song_params)
    end

    private
        def post_params(*args)
            params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
        end
end
