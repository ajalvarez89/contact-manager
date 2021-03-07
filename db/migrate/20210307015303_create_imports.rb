# frozen_string_literal: true

class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :file_path
      t.integer :status

      t.timestamps
    end
  end
end
