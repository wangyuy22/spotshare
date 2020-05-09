require 'rspotify'

class SongsController < ApplicationController
  before_action :authenticate_user
  before_action :set_song, only: [:show, :destroy]
  before_action :check_playlist_owner, only: [:new, :create, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @playlist = Playlist.find(params[:playlist_id])
    @song = @playlist.songs.build
  end

  # POST /songs
  # POST /songs.json
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @song = @playlist.songs.build(song_params)
    if (RSpotify::Track.search("#{@song.name} #{@song.artist}", limit: 10, market: 'US').first == nil)
      redirect_to playlist_path(@playlist)
    else 
      respond_to do |format|
        if @song.save
          format.html { redirect_to playlist_song_path(@playlist, @song), notice: 'Song was successfully created.' }
          format.json { render :show, status: :created, location: @song }
        else
          format.html { render :new }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :artist, :playlist_id)
    end


    def check_playlist_owner
      @playlist = Playlist.find(params[:playlist_id])
      redirect_to playlist_path(@playlist) unless @playlist.owner == current_user.username
    end

end
