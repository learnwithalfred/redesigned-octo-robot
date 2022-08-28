# frozen_string_literal: true

class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name, null: false, unique: true
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
