# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.string  :city
      t.string  :state
      t.string  :country
      t.bigint  :mobile_number
      t.date    :date_of_birth
      t.uuid    :user_id

      t.timestamps
    end
  end
end
