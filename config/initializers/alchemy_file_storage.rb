if Rails.env.production?
  require 'dragonfly'
  require 'dragonfly/s3_data_store'
 
  aws_defaults = {
    access_key_id: Rails.configuration.aws_access_key_id,
    secret_access_key: Rails.configuration.aws_secret_access_key,
    region: ENV['AWS_REGION'],
    storage_headers: {'x-amz-acl' => 'public-read'},
    url_scheme: 'https'
  }
 
  Dragonfly.app(:alchemy_pictures).configure do
    plugin :imagemagick
    datastore :s3,
      { bucket_name: Rails.configuration.aws_pictures_directory }.merge(aws_defaults)
  end
 
  Dragonfly.app(:alchemy_attachments).configure do
    datastore :s3,
      { bucket_name: Rails.configuration.aws_attachments_directory }.merge(aws_defaults)
  end


end