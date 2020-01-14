FactoryBot.define do
  factory :movie do
    category {FactoryBot.create(:category)}
    title {"my_movie"}
    description {"qwerty"}
  end
end
