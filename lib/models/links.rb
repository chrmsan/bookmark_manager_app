class Link

 	include DataMapper::Resource
	
	has n, :tags, through: Resource  #adding association to tags model which is a child_model to Link 

	property :id, 		Serial
	property :title, 	String
	property :url, 		String

end
