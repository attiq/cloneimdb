class HomeController < ApplicationController

  def index
    @home_movies = Movie.order('RANDOM()').limit(3)
    @movies = Movie.all.page(params[:page]).per(6)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def search
    category = Category.find(params[:id])
    @movies = category.movies
    render json: {success: true, html: render_to_string(partial: '/home/movies')}.to_json
  end
end
