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
  config.fog_directory    = ENV['S3_BUCKET_NAME']
  config.cache_dir     = "#{Rails.root}/tmp/uploads"

  case Rails.env
   when 'production'
     config.fog_directory = 'dummy'
     config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy'

   when 'development'
     config.fog_directory = 'dev.dummy'
     config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.dummy'

   when 'test'
     config.fog_directory = 'test.dummy'
     config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.dummy'
 end
end
