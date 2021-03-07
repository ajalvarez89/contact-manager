# frozen_string_literal: true

class AttachableUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "csv/#{ model.class.to_s.underscore }/contact}"
  end

  def extension_whitelist
    %w[jpg jpeg gif csv pdf]
  end

  def fog_public
    false
  end

  def fog_authenticated_url_expiration
    5
  end
end
