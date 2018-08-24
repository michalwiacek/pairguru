class Api::V1::MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render json: @movies, each_serializer: MoviesSerializer
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, serializer: MoviesSerializer
  end
end
