require 'rails_helper'

RSpec.describe Movie, type: :model do

  it "category should be present" do
    movie = FactoryBot.create(:movie)
    movie.category_id = nil
    expect(movie).to_not be_valid
  end

  it "title should be present" do
    movie = FactoryBot.create(:movie)
    movie.title = nil
    expect(movie).to_not be_valid
  end
end