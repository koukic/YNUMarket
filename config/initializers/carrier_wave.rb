require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage :fog
    config.asset_host = 'https://s3-ap-northeast1.amazonaws.com'
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S❯ heroku logs | grep error3_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
