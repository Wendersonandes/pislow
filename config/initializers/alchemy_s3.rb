
if Rails.env.production?

  require 'dragonfly/s3_data_store'
 
  aws_defaults = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    storage_headers: {'x-amz-acl' => 'public-read'},
    url_scheme: 'https'
  }
 
  Dragonfly.app(:alchemy_pictures).configure do
    plugin :imagemagick
    datastore :s3,
      bucket_name: ENV['AWS_PICTURES_DIRECTORY'],
  end
 
  Dragonfly.app(:alchemy_attachments).configure do
    datastore :s3,
      bucket_name: ENV['AWS_ATTACHMENTS_DIRECTORY'],
  end
end