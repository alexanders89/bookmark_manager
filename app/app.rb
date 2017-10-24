ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'data_mapper_setup'

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
    link = Link.create(url: (params[:url]), title: (params[:title]))
    tag = tag  = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

end
