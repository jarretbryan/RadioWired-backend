class Api::V1::FavoritesController < ApplicationController

    before_action :get_favorite, only: [:destroy]

    def index
        @favorites = Favorite.all
        render json: @favorites
    end

    def create
        @favorite = Favorite.create(new_fav_params)
    end

    def destroy
        @favorite.delete
    end

    private

     def get_favorite
        @favorite = Favorite.find(params[:id])
    end

    def new_fav_params
        params.permit(:user_id, :subscription_id)
    end

end
