# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :birth_date, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.string :credit_card, null: false
      t.string :card_type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
