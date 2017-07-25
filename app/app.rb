require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    p @links
    erb :links
  end

  post '/links' do
    title = params[:title]
    url = params[:url]
    Link.create(title: title, url: url)
    redirect '/links'
  end

  get '/links/new' do
    erb :link_new
  end

  run! if app_file == $0

end
