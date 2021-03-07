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
      import.save!

      import_contacts!

      true
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
  end
end
