class Api::V1::PlaylistsController < ApplicationController

    before_action :get_playlist, only: [:show]

    def index
        @playlists = Playlist.all
        render json: @playlists
    end

    def show
        render json: @playlist
    end

    def create
        @playlist = Playlist.create(new_playlist_params)
        if @playlist.save
            response ={message: 'New Playlist generated'}
            render json: @playlist, status: :accepted
        else
            render json: { errors: @playlist.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def get_playlist
        @playlist = Playlist.find(params[:id])
    end

    def new_playlist_params
        params.permit(:title, :description, :genre)
    end

end
