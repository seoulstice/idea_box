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
      config.fog_credentials = {
            :provider                   =>  'AWS'
            :aws_access_key_id          =>  ENV['AWSAccessKeyId']
            :aws_secret_access_key      =>  ENV['AWSSecretKey']
            :region                     =>  ENV['AWS_REGION']
      }
      config.fog_directort              =   ENV['S3_BUCKET_NAME']
      config.fog_use_ssl_for_aws = false
  end

  # config.aws_credentials = {
  #   access_key_id:     ENV.fetch('AWSAccessKeyId'),
  #   secret_access_key: ENV.fetch('AWSSecretKey'),
  #   region:            ENV.fetch('AWS_REGION')
  # }
end
