require "shrine"
# require "shrine/storage/file_system"
require "shrine/storage/s3"

# Shrine.storages = {
#     cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
#     store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"), # permanent
# }

s3_options = {
  bucket:            ENV["S3_BUCKET"], # required
  access_key_id:     ENV["S3_ACCESS_KEY_ID"],
  secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
  region:            ENV["S3_REGION"],
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :activerecord # loads Active Record integration
Shrine.plugin :instrumentation        # adds instrumentation
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data    # re-extract metadata when attaching a cached file
Shrine.plugin :url_options, cache: { expires_in: 24*60*60 }, store: { expires_in: 24*60*60 }
Shrine.plugin :derivatives