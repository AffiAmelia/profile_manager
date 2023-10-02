# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :serial_number, null: false
      t.index :serial_number, unique: true
      t.string :description
      t.string :phone_number, null: false
      t.string :email, null: false
      t.string :address
      t.string :designation
      t.string :skills, null: false
      t.references :user, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
