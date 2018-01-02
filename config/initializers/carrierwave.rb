require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :aws
      config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
      config.aws_acl    = 'public-read'
      config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
    end
  end

  config.aws_credentials = {
    access_key_id:     ENV.fetch('AWSAccessKeyId'),
    secret_access_key: ENV.fetch('AWSSecretKey'),
    region:            ENV.fetch('AWS_REGION') # Required
  }
end
