require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  post "/songs" do
    song = Song.create(params[:song])
    song.artist = Artist.find_or_create_by(params[:artist]) if !params[:artist][:name].empty?
    song.genres << Genre.create(params[:genre]) if !params[:genre][:name].empty?
    song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    song.artist = Artist.find_or_create_by(params[:artist]) if !params[:artist][:name].empty?
    song.genres << Genre.create(params[:genre]) if !params[:genre][:name].empty?
    song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end

end
