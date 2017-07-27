ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    title = params[:title]
    url = params[:url]
    link = Link.new(title: title, url: url)
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save

    redirect '/links'
  end

  get '/links/new' do
    erb :link_new
  end

  run! if app_file == $0
end
