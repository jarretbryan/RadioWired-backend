class Api::V1::GenreController < ApplicationController
    def index
        @genres = Genre.all
        render json: @genres
    end
end
