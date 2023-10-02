# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title, null: false
      t.index :title
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :description
      t.string :skills
      t.references :profile, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
