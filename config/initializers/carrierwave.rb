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
      config.storage    = :aws
      config.aws_bucket = "concert-box-app"
      config.aws_acl    = :public_read
      config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

      config.aws_credentials = {
            :provider                   =>  'AWS',
            :aws_access_key_id          =>  ENV['AWSAccessKeyId'],
            :aws_secret_access_key      =>  ENV['AWSSecretKey'],
            :region                     =>  ENV['AWS_REGION'],
      }
      config.storage = :aws
      config.cache_dir = "#{Rails.root}/tmp/uploads"
    end
  end
end
