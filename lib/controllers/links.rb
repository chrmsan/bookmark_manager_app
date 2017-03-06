class MyApp < Sinatra::Base

	get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url]) 
    params[:tags].split.each do |tag| 
      link.tags << Tag.first_or_create(name: tag) 
    end
    link.save   #Saves the link
    redirect '/links'
  end

end