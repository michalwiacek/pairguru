class Api::V1::GenresController < ApplicationController

  def index
    @genres = Genre.all
    render json: @genres, each_serializer: GenresSerializer
  end

  def show
    @genre = Genre.find(params[:id])
    render json: @genre, serializer: GenresSerializer
  end
end
