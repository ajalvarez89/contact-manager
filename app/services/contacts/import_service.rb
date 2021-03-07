# frozen_string_literal: true

module Contacts
  class ImportService
    attr_reader :file, :user, :import

    def initialize(file:, user:, import:)
      @file = file
      @user = user
      @import = import
    end

    def execute!
      import.file_path = file.path
      import.user = user
      import.processing!
      import.save

      import_contacts!
      update_file_path! if upload_file!
    end

    def import_contacts!
      successful = []
      CSV.foreach(file.path, headers: true, col_sep: ';', header_converters: :symbol) do |row|
        row = row.to_hash.with_indifferent_access
        row[:user] = user
        contact = Contact.create row

        if contact.valid?
          successful.push(contact)
        else
          ImportError.create(
            contact: JSON.parse(contact.to_json),
            contact_error: contact.errors.messages.to_h,
            import: import
          )
        end

        successful.length.zero? ? import.failed! : import.finished!
      end
    end

    def update_file_path!
      import.file_path = get_file_url
      import.save
    end

    def get_file_url
      obj = s3.objects(s3.documents_key(import.id))
      obj.presigned_url(:get, expires_in: 10)
    end

    def upload_file!
      s3.upload(import.id, file.path)
    end

    def s3
      @s3 ||= S3.new
    end
  end
end
