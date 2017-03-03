ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class MyApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'
  
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url]) #create links
    params[:tags].split.each do |tag| #acquires the tags params and splits each word into seperate objects
      link.tags << Tag.first_or_create(name: tag) #the first_or_create checks if there is a similar word from before and adds it to the Tag database, and also pushes it to the links database
    end
    link.save   #Saves the link
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/links'
  end

  run! if app_file == $0
end
