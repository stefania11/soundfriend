require 'soundcloud'
require "open-uri"
require 'rubygems'
require 'json'

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    client_playlist = Soundcloud.new(:client_id => Rails.application.secrets.soundcloud_client_id,
                        :client_secret => Rails.application.secrets.soundcloud_secret,
                        :username => Rails.application.secrets.soundcloud_username,
                        :password => Rails.application.secrets.soundcloud_password)
    client_track = SoundCloud.new(:client_id => Rails.application.secrets.soundcloud_client_id)
    # create an array of track ids
    track_url = Post.find(params[:id]).try(:track_url)
    # puts track_url.inspect
    embed_info = client_track.get('/oembed', :url => track_url)
    @song = embed_info['html']
    @track_id = client_track.get('/resolve', :url => track_url).id
    @playlists = client_playlist.get("/me/playlists")
  end

  def playlist
    client_playlist = Soundcloud.new(:client_id => Rails.application.secrets.soundcloud_client_id, :client_secret => Rails.application.secrets.soundcloud_secret, :username => Rails.application.secrets.soundcloud_username, :password => Rails.application.secrets.soundcloud_password)
    client_track = SoundCloud.new(:client_id => Rails.application.secrets.soundcloud_client_id)
    body_track_json = open("http://api.soundcloud.com/tracks/217337107?client_id=#{Rails.application.secrets.soundcloud_client_id}"){|f| f.read }
    parsed = JSON.parse(body_track_json)
    track_url = parsed["permalink_url"]
    @track_id = client_track.get('/resolve', :url => track_url).id
    @playlist = client_playlist.get("/me/playlists/#{params[:playlist]}")
    track_ids = @playlist.tracks.map(&:id)
    # puts track_ids
    track_ids << @track_id
    tracks = track_ids.map{|id| {:id => id}}

    begin
      playlist = client_playlist.put(@playlist.uri, :playlist => {
        :tracks => tracks
      })
    rescue Soundcloud::ResponseError => e
      puts "Error: #{e.message}, Status Code: #{e.response.code}"
    end
    redirect_to :root
  end

  # playlists/7.json
  def get_playlist
    playlist = Playlist.find(params[:id])
    render json: playlist
  end


  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    current_user.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :track_url)
    end

end
