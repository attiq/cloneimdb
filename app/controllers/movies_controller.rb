class MoviesController < ApplicationController
  before_action :load_movie
  before_action :ensure_canonical_url

  def show
  end

  private

  def load_movie
    @movie = Movie.find(params[:id])
  end

  def ensure_canonical_url
    redirect_to @movie if @movie.to_param != params[:id]
  end
end
