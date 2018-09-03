class Api::V1::ListennotesController < ApplicationController


    def create
        @user = User.find(new_cast_params[:user_id])

        new_cast_params['selectedGenres'].each do |num|
            response = Unirest.get `https://listennotes.p.mashape.com/api/v1/best_podcasts?genre_id=#{num}`, 
            headers:{
                "X-Mashape-Key" => ENV['X_MASHAPE_KEY'], 
                "X-Mashape-Host" => ENV['X_MASHAPE_HOST']
            }

            best_cast_array = JSON.parse(response.raw_body)['channels']

            best_cast_array.each do |stream_obj|
                Subscription.create(website: stream_obj['website'], publisher: stream_obj['publisher'], title: stream_obj['title'], country: stream_obj['country'], image: stream_obj['image'], rss: stream_obj['rss'], language: stream_obj['language'], thumbnail: stream_obj['thumbnail'], description: stream_obj['description'], :ep_id: stream_obj['id'], playlist_id: @user.playlists[-1].id)
            end
        end



    end

    private 

    def new_cast_params
        params.permit(:selectedGenres, :user_id)
    end
    
end
