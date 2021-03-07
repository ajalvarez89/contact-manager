require 'aws-sdk-s3'

class S3
  def initialize
    @s3 = Aws::S3::Resource.new(region: ENV["AWS_REGION"])
    @folder = ENV["AWS_FOLDER_NAME"]
    @bucket_name = ENV["AWS_BUCKET_NAME"]
  end

  def upload(import_id, path_name)
    obj = @s3.bucket(@bucket_name).object("#{@folder}/#{import_id}")
    obj.upload_file(path_name)
  end

  def documents_key(import_id)
    documents_directory(import_id)
  end

  def documents_directory(import_id)
    "#{@folder}/#{import_id}"
  end

  def objects(key)
    @s3.bucket(@bucket_name).object(key)
  end
end
