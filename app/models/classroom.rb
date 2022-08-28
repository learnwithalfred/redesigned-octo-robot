# frozen_string_literal: true

class Classroom < ApplicationRecord
  MINIMUM_ROW = 0
  MAXIMUM_ROW = 30

  has_many :students
  has_many :courses

  validates :name, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: MINIMUM_ROW..MAXIMUM_ROW }, uniqueness: true
end
