class Api::V1::UsersController < ApplicationController

    before_action :get_user, only: [:show, :update, :destroy]
    

    # Not for use in front end client

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end


    def register
        @user = User.find_or_create_by(user_params)
        if @user.save
            response ={message: 'User registration accepted!'}
            render json: @user, status: :accepted
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def destroy
        @user.delete 
    end


    private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:email, :password_digest)
    end

end
