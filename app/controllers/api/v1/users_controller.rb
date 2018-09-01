# require_relative '../../../services/stream_from_genre_service'

class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:index, :register]
    # # include ListenNotes

    before_action :get_user, only: [:show, :update, :destroy]
    before_action :create_genres, only: [:register]
    

    # Not for use in front end client

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end


    def register
        # @user = User.find_or_create_by(register_user_params)
        @user = User.create(register_user_params) 
        if @user.save
            response ={message: 'User registration accepted!'}
            render json: @user, status: :accepted
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
        end
        p @user.id
        Playlist.create(title: 'Welcome Playlist!', description:'This is your first playlist! Feel free to edit this and makeit your own!', user_id: @user.id)
    end

    def profile
        if logged_in
            render json: {user: UserSerializer.new(current_user)}, status: :accepted
        else
            render json: {message: 'User not found'}, status: :not_found
        end
    end

    def destroy
        @user.delete 
    end


    private

    def get_user
        @user = User.find(params[:id])
    end

    def register_user_params
        # params.permit(:username, :password_digest)
        params.permit(:email, :password, :username, :profile_image)
    end

    def create_genres
        # byebug
        if Genre.all.length < 2 
            response = Unirest.get "https://listennotes.p.mashape.com/api/v1/genres", 
            headers:{
                "X-Mashape-Key" => ENV['X_MASHAPE_KEY'], 
                "X-Mashape-Host" => ENV['X_MASHAPE_HOST']
            }
            # byebug
            

        genre_array = JSON.parse(response.raw_body)['genres']

        genre_array.each do |genre_obj|
            Genre.create(name: genre_obj['name'], api_id: genre_obj['id'])
        end
    end

  end



end
