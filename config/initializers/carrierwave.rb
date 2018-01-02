require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'carrierwave/orm/activerecord'

if Rails.env.development? || Rails.env.test?
  # CarrierWave.configure do |config|
  #   config.storage = :file
  # end
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = "concert-box-app"
    config.aws_acl    = :public_read
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
          :access_key_id          =>  ENV["AWSAccessKeyId"],
          :secret_access_key      =>  ENV["AWSSecretKey"],
          :region                     =>  ENV["AWS_REGION"],
    }
    config.storage = :aws
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
elsif Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = "concert-box-app"
    config.aws_acl    = :public_read
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
          :access_key_id          =>  ENV["AWSAccessKeyId"],
          :secret_access_key      =>  ENV["AWSSecretKey"],
          :region                     =>  ENV["AWS_REGION"],
    }
    config.storage = :aws
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
