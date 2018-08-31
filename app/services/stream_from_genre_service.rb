# require 'json'
# ## test run for genre

# class ListenNotes
#   # def initialize(params)
#   #   @playlist = params[:playlist]
#   # end

#   # treat this like an adapter
#   # might refactor to make this an adapter object, not a service object 

#   # i have to iterate through an object that has all the key value pairs for genre, and pass that into my response below

#   def self.get_genre_pairs
#     response = Unirest.get "https://listennotes.p.mashape.com/api/v1/genres",
#     headers:{
#       "X-Mashape-Key" => ENV['X-MASHAPE-KEY'],
#       "X-Mashape-Host" => ENV['X-MASHAPE-HOST']
#     }

#     genre_array = JSON.parse(response.genres)

#     genre_array.each do |genre_obj|
#       Genre.create(name: genre_obj.name, api_id: genre_obj.id)
#     end

#   end


#   # # I have to pass in an object with the key genre
#   # def get_stream_by_genre
#   #   def initialize(params)
#   #     @genre_string = params[:genre]
#   #   end
    
  

    
#   #   response = Unirest.get "https://listennotes.p.mashape.com/api/v1/best_podcasts?genre_id=133&page=2",
#   #   headers:{
#   #     "X-Mashape-Key" => ENV['X-MASHAPE-KEY'],
#   #     "X-Mashape-Host" => ENV['X-MASHAPE-HOST']
#   #   }
    
#   #   # genre_info here is a string (stringified hash)
#   #   genre_info = response.raw_body
    
#   #   # get JSON
#   #   genre_hash = JSON.parse(genre_info)
    
#   #   list_of_relevant_podcasts = genre_hash["channels"]
    
    
#     # dont do request
    
#   end
  