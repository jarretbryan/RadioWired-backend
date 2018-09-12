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
            Subscription.create(website: stream_obj['website'], publisher: stream_obj['publisher'], title: stream_obj['title'], country: stream_obj['country'], image: stream_obj['image'], rss: stream_obj['rss'], language: stream_obj['language'], thumbnail: stream_obj['thumbnail'], description: stream_obj['description'], ep_id: stream_obj['id'], playlist_id: @user.playlists.last.id)
        end
        render json: {subscription: Subscription.last}
    end

    def episodes_create

        id_num = new_ep_params[:stream_id]

        episodes_arr = get_episode(id_num)

        latest_ep = episodes_arr[0]

        Episode.create(title: latest_ep['title'], description: latest_ep['description'], audio: latest_ep['audio'], episode_id: latest_ep['id'], audio_length: latest_ep['audio_length'])

        render json: {latest_episode: Episode.last}

    end

    def episodes_delete
        Episode.last.delete
    end


    private 

    def new_cast_params
        params.require(:listennote).permit(:user_id, :list_length, :selectedGenres => [])
    end

    def new_ep_params
        params.require(:listennote).permit(:stream_id)
    end

    def get_genre(num)
        
        response = Unirest.get 'https://listennotes.p.mashape.com/api/v1/best_podcasts?genre_id='+num.to_s, 
            headers:{
                "X-Mashape-Key" => ENV['X_MASHAPE_KEY'], 
                "X-Mashape-Host" => ENV['X_MASHAPE_HOST']
            }

        JSON.parse(response.raw_body)['channels']
    end

    def get_episode(num)
        response = Unirest.get 'https://listennotes.p.mashape.com/api/v1/podcasts/'+num, 
            headers:{
                "X-Mashape-Key" => ENV['X_MASHAPE_KEY'], 
                "X-Mashape-Host" => ENV['X_MASHAPE_HOST']
            }

            

        JSON.parse(response.raw_body)['episodes']
    end
    
end
