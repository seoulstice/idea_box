require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  config.fog_credentials = {
                            provider:              'AWS',
                            aws_access_key_id:     ENV['AWSAccessKeyId'],
                            aws_secret_access_key: ENV['AWSSecretKey'],
                            }
  config.fog_directory  = ENV['AWS_BUCKET']

  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  # config.cache_dir = "#{Rails.root}/tmp/uploads"

  config.fog_directory    = ENV['S3_BUCKET_NAME']
end
