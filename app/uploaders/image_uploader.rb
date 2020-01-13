require "image_processing/mini_magick"

class ImageUploader < Shrine
  ALLOWED_TYPES = %w[image/jpeg image/png image/webp image/bmp image/x-icon image/tiff]
  MAX_SIZE = 50*1024*1024 # 50 MB
  MAX_DIMENSIONS = [5000, 5000] # 5000x5000

  plugin :validation_helpers

  # File validations (requires `validation_helpers` plugin)
  Attacher.validate do
    validate_size 0..MAX_SIZE
    validate_mime_type ALLOWED_TYPES
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
        large: magick.resize_to_limit!(900, 400),
        medium: magick.resize_to_limit!(900, 350),
        small: magick.resize_to_limit!(700, 400),
        thumb: magick.resize_to_limit!(100, 100)
    }
  end
end