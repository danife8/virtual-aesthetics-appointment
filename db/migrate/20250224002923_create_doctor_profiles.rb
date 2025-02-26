# frozen_string_literal: true

class CreateDoctorProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :doctor_profiles do |t|
      t.string :specialization
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
