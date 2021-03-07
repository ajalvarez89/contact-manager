# frozen_string_literal: true

class AddImportToImportError < ActiveRecord::Migration[6.0]
  def change
    add_reference :import_errors, :import, null: false, foreign_key: true
  end
end
