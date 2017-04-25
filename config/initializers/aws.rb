if Rails.env.production?
  attachment_config = {
    s3_credentials: {
      access_key_id:     ENV['AKIAJTWOFCQPZS5WDWKQ'],
      secret_access_key: ENV['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'],
      bucket:            ENV['pislow'],
    },

    storage:        :s3,
    s3_headers:     { 'Cache-Control' => 'max-age=31557600' },
    s3_protocol:    'https',
    bucket:         ENV['pislow'],
    url:            ":pislow.s3-eu-central-1.amazonaws.com",


    styles: {
            micro: '44x56>',
            mini: ' 117x150>',
            small: '245x313>',
            product: '512x654>',
            large: '1422x1855>',
    },

    path:           '/:class/:id/:style/:basename.:extension',
    default_url:    'noimage/:style.png',
    default_style:  'product'
  }

  attachment_config.each do |key, value|
    Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
  end
end