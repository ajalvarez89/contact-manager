# frozen_string_literal: true

require 'tempfile'

class WorkUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "contact-manager/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end

  def extension_whitelist
    %w[text/csv application/vnd.ms-excel]
  end

  process :clean_file

  private

  def clean_file
    tempfile = Tempfile.open('temp_csv', encoding: 'utf-8') do |f|
      File.foreach(current_path) do |line|
        f.puts line.encode('UTF-8', invalid: :replace, undef: :replace)
      end
      f
    end
    FileUtils.mv(tempfile.path, current_path)
  end
end
