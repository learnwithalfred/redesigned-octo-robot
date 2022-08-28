# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.datetime :course_date, null: false
      t.string :status, default: "pending", null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
