# frozen_string_literal: true

class CreateImportErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :import_errors do |t|
      t.jsonb :contact
      t.jsonb :contact_error

      t.timestamps
    end
  end
end
