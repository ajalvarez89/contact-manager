require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIARWRMIH3UF353WXVW',
    :aws_secret_access_key => '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'
  }
  config.fog_directory = 'ajalvarez'
  config.storage = :fog
end
