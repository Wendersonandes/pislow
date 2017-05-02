if Rails.env.production?

require 'dragonfly/s3_data_store'

pictures_app = Dragonfly.app(:alchemy_pictures)
pictures_app.configure_with(:imagemagick)
pictures_app.configure do
  datastore :s3,
    bucket_name: ENV['AWS_PICTURES_DIRECTORY'],
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    storage_headers: {'x-amz-acl' => 'public-read'},
    url_scheme: 'https'
end

attachments_app = Dragonfly.app(:alchemy_attachments)
attachments_app.configure do
  datastore :s3,
    bucket_name: ENV['AWS_ATTACHMENTS_DIRECTORY'],
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    storage_headers: {'x-amz-acl' => 'public-read'},
    url_scheme: 'https'
end


end