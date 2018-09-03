class Api::V1::ListennotesController < ApplicationController


    def create
       
        @user = User.find(new_cast_params[:user_id])
        mega_cast_arr = []

        
        new_cast_params['selectedGenres'].each do |num|
            best_cast_array = get_genre(num.to_i)
            mega_cast_arr.push(best_cast_array) 
        end
        
 
        definitive_mega_array = mega_cast_arr.flatten

        random_selection_array = definitive_mega_array.sample(new_cast_params[:list_length])

        

        random_selection_array.each do |stream_obj|
            Subscription.create(website: stream_obj['website'], publisher: stream_obj['publisher'], title: stream_obj['title'], country: stream_obj['country'], image: stream_obj['image'], rss: stream_obj['rss'], language: stream_obj['language'], thumbnail: stream_obj['thumbnail'], description: stream_obj['description'], ep_id: stream_obj['id'], playlist_id: @user.playlists[-1].id)
        end
    end

    private 

    def new_cast_params
        params.require(:listennote).permit(:user_id, :list_length, :selectedGenres => [])
    end

    def get_genre(num)
        
        response = Unirest.get 'https://listennotes.p.mashape.com/api/v1/best_podcasts?genre_id='+num.to_s, 
            headers:{
                "X-Mashape-Key" => ENV['X_MASHAPE_KEY'], 
                "X-Mashape-Host" => ENV['X_MASHAPE_HOST']
            }

        JSON.parse(response.raw_body)['channels']
    end
    
end
