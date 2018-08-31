class Api::V1::SubscriptionsController < ApplicationController

    before_action :get_sub, only: [:show]

    def index
        @subscriptions = Subscription.all
        render json: @subscriptions
    end

    def show
        render json: @sub
    end

     def create
        @subscription = Subscription.create(new_sub_params)
        if @subscription.save
            response ={message: 'Subscribed!'}
            render json: @subscription, status: :accepted
        else
            render json: { errors: @subscription.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def get_sub
        @sub = Subscription.find(params[:id])
    end

    #remember ep_id really refers to the stream_id not the episode_id
    def new_sub_params
        params.permit(:website, :publisher, :title, :country, :image, :rss, :language, :thumbnail, :description, :ep_id, :playlist_id)
    end


end
