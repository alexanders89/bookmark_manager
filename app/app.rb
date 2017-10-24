ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/testing' do
    'Testing Infrastructure OK'
  end


  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/new' do
    erb :'links/new'
  end

  post '/new' do
    Link.create(url: (params[:url]), title: (params[:title]))
    redirect '/links'
  end

end
