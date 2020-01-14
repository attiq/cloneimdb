require 'rails_helper'

# Change this ArticlesController to your project
RSpec.describe MoviesController, type: :controller do

  context "GET show/:id" do
    it "should show movie" do
      movie = FactoryBot.create(:movie)
      get :show, params: {id: movie.id}
      response.should redirect_to(movie)
    end
  end
end
