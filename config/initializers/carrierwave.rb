require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'carrierwave/orm/activerecord'

if Rails.env.development? or Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
    config.fog_credentials = {
                              provider:              'AWS',
                              aws_access_key_id:     ENV['AWSAccessKeyId'],
                              aws_secret_access_key: ENV['AWSSecretKey'],
                              }
    config.fog_directory    = ENV['S3_BUCKET_NAME']
    config.cache_dir     = "#{Rails.root}/tmp/uploads"
  end
end
