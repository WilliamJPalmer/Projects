class UserplaylistsController < ApplicationController

  before_action :require_login

  def index
  end

  def create
    @user = User.find(session[:user_id])
    @song = Song.find(params[:song_id])
    @songs = Userplaylist.create(song: @song, user: @user, add:+1)

    @song = Song.find(params[:id])
    puts'>>>>>>>>>>--------------***************'
    @user = User.find(session[:user_id])
    puts'>>>>>>>>>>--------------***************'
    @song.update_attribute(:count, @song.count += 1)
    puts'>>>>>>>>>>--------------***************'

    redirect_to :back

  end

  def show
    @songs = Song.all
    @playlist = Userplaylist.all.song
    @songlist = []
    puts @songs
    @playlist.each do |song|
      if Userplaylist.all.where("song_id=?", song.id).length > 0
        @songlist << song
        puts @songlist
        puts'>>>>>>>>>>--------------***************'
      end
  end
end

  def update
    @song = Song.find(params[:id])
    puts'>>>>>>>>>>--------------***************'
    @user = User.find(session[:user_id])
    puts'>>>>>>>>>>--------------***************'
    @song.update_attribute(:count, @song.count += 1)
    puts'>>>>>>>>>>--------------***************'
    # Userplaylist.update(count:+1
    # @Playlist = Userplaylist.create()
    redirect_to '/userplaylists/create'
  end

end
