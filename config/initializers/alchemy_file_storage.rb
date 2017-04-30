if Rails.env.production?
  require 'dragonfly'
  require 'dragonfly/s3_data_store'
 
  aws_defaults = {
    access_key_id: Rails.configuration.aws_access_key_id,
    secret_access_key: Rails.configuration.aws_secret_access_key,
    region: ENV['AWS_REGION']
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

# Enable Rack::Cache to put a simple HTTP cache in front of your application
# Add `rack-cache` to your Gemfile before enabling this.
# For large-scale production use, consider using a caching reverse proxy like
# NGINX, varnish or squid.
config.action_dispatch.rack_cache = true
# use the Dalli client for its cache-store
config.cache_store = :dalli_store
client = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                         :username => ENV["MEMCACHIER_USERNAME"],
                         :password => ENV["MEMCACHIER_PASSWORD"],
                         :failover => true,
                         :socket_timeout => 1.5,
                         :socket_failure_delay => 0.2,
                         :value_max_bytes => 10485760)
config.action_dispatch.rack_cache = {
  :metastore    => client,
  :entitystore  => client
}
config.static_cache_control = "public, max-age=311040000"
end