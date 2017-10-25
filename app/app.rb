ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/testing' do
    'Testing Infrastructure OK'
  end

  get '/' do
    erb :'links/signin'
  end

  post '/signin' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end


  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/new' do
    erb :'links/new'
  end

  post '/new' do
    link = Link.create(url: (params[:url]), title: (params[:title]))
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
