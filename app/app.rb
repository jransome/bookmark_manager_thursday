ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end
  end

  get '/' do
    erb :index
  end

  post '/sign_up' do
    p params[:password]
    user = User.create(email: params[:email])#, password: params[:password])
    user.password = params[:password]
    user.save
    session[:current_user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @user = current_user
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
