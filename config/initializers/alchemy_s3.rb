
if Rails.env.production?

# Alchemy CMS Dragonfly configuration.

# Upload files to S3 support Heroku (no local file storage) and clustering.
# Used in all environments so the database can be migrated between them without breaking images.
require 'dragonfly/s3_data_store'

# Pictures
Dragonfly.app(:alchemy_pictures).configure do
  plugin :imagemagick
  datastore :s3,
            bucket_name: ENV['AWS_PICTURES_DIRECTORY'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            store_meta: false,
            storage_headers: {
              'Cache-Control' => 'public, max-age=31536000',
              'x-amz-acl' => 'public-read'
            }
  url_format '/pictures/:job/:basename.:format'
  url_path_prefix '/store'
end

# Attachments
Dragonfly.app(:alchemy_attachments).configure do
  datastore :s3,
            bucket_name: ENV['AWS_ATTACHMENTS_DIRECTORY'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            store_meta: false,
            storage_headers: {
              'Cache-Control' => 'public, max-age=31536000',
              'x-amz-acl' => 'public-read'
            }
end

# Logger
Dragonfly.logger = Rails.logger

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end


end
