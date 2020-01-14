require 'rails_helper'

RSpec.describe Category, type: :model do
  
  it "name should be present" do
    category = FactoryBot.create(:category)
    category.name = nil
    expect(category).to_not be_valid
  end
end