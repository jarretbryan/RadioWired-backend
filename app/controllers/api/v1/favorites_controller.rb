class Api::V1::FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
        render json: @favorites
    end

    def create
        @favorite = Favorite.create(new_fav_params)
    end

    private

    def new_fav_params
        params.permit(:user_id, :subscription_id)
    end



end
