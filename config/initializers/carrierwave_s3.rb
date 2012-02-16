S3_CONFIG = YAML.load_file("#{Rails.root}/config/amazon_s3.yml")[Rails.env]

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => S3_CONFIG['access_key_id'],       # required
    :aws_secret_access_key  => S3_CONFIG['secret_access_key'],       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  =  S3_CONFIG['bucket']                     # required
end
