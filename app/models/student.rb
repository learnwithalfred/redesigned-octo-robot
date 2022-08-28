# frozen_string_literal: true

class Student < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :classroom_id, presence: true
  validates :dob, presence: true
  validates :about, presence: true
  validates :contact, presence: true
  validates :father, presence: true
  validates :mother, presence: true

  belongs_to :user
  belongs_to :classroom
end
