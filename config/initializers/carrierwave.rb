require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWSAccessKeyId'],
      aws_secret_access_key: ENV['AWSSecretKey'],
  }
  config.fog_directory  = ENV['AWS_BUCKET']
end
