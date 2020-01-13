class Movie < ApplicationRecord
  belongs_to :category

  validates :title, presence: true

  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute

  ratyrate_rateable  'ratings'
  
  before_save do
    image_derivatives! if image_changed? # create derivatives
  end

  # For SEO-Friendly URLs
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
