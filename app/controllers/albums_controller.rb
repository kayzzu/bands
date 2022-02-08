class AlbumsController < ApplicationController
    def index
        albums = Album.order('created_at DESC');
        render json: {
            status: 'success',
            message: 'Loaded albums',
            data:albums
        },
        status: :ok
    end

    def show
        album = Album.find(params[:id])
        render json: {
            status: 'success',
            message: 'Loaded album',
            data:album
        },
        status: :ok
    end

    def create
        album = Album.new(album_params)
        if album.save
            render json: {
            status: 'success',
            message: 'saved album',
            data:album
        },
        status: :ok
        else  
            render json: {
                status: 'error',
                message: 'could not save album',
                data:album.error
            },
            status: :unprocessable_entity
        end
    end

    def destroy 
        album = Album.find(params[:id])
        album.destroy
            render json: {
            status: 'success',
            message: 'deleted album',
            data:album
        },
        status: :ok
    end

    def update
        album = Album.find(params[:id])
        if album.update(album_params)
        render json: {
            status: 'success',
            message:'Updated album',
            data:album
        },
        status: :ok
        else
        render json: {
            status: 'error', 
            message:'album not updated', 
            data:album.errors
        },
        status: :unprocessable_entity
        end
    end

    private

    def album_params
        params.permit(:title, :band)
    end
end