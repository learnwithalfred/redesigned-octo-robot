# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.date :dob, null: false
      t.string :contact, null: false
      t.string :father, null: false
      t.string :mother, null: false
      t.text :about, null: false
      t.references :user, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
