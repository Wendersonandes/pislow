Spree.config do |config|
  attachment_config = {
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      bucket: ENV['S3_BUCKET_NAME']
    },

    storage:        :s3,
    s3_headers:     { "Cache-Control" => "max-age=31557600" },
    s3_protocol:    "https",
    s3_region:      ENV['AWS_REGION'],
    s3_host_alias:  ENV['CDN_HOST'],
    bucket:         ENV['S3_BUCKET_NAME'],

    styles: {
            micro: '44x56>',
            mini: ' 117x150>',
            small: '245x313>',
            product: '512x654>',
            large: '1422x1855>',
    },

    path:          "/products/:id/:style/:basename.:extension",
    default_url:   "/products/:id/:style/:basename.:extension",
    default_style: "product"
  }

  attachment_config.each do |key, value|
    Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
  end
end 