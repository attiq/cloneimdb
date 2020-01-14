require 'rails_helper'

# Change this ArticlesController to your project
RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @home_movies" do
      movie = FactoryBot.create(:movie)
      get :index
      expect(assigns(:home_movies)).to eq([movie])
    end

    it "assigns @movies" do
      movie = FactoryBot.create(:movie)
      get :index
      expect(assigns(:movies)).to eq([movie])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #search" do
    it "returns a success response" do
      category = FactoryBot.create(:category)
      get :search, params: {id: category.id}
      expect(response).to be_successful
    end

    it "assigns @movies" do
      category = FactoryBot.create(:category)
      movie = FactoryBot.create(:movie)
      category.movies << movie
      get :search, params: {id: category.id}
      expect(assigns(:movies)).to eq([movie])
    end
  end
end
