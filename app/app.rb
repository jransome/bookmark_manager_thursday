ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/sign_up' do
    user = User.new(email: params[:email], password: params[:password])
    user.save
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].downcase.split(',').each do |tag|
      link.tags << Tag.first_or_create(name: tag.strip)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :link_new
  end

  get '/tags/:tag' do
    @tag = params[:tag]
    @links = Tag.all(:name => params[:tag]).links
    erb :tag_results
  end

  run! if app_file == $0
end
