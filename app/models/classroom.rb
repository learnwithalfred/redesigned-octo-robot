# frozen_string_literal: true

class Classroom < ApplicationRecord
  MINIMUM_ROW = 0
  MAXIMUM_ROW = 30

  has_many :students, dependent: :destroy
  has_many :courses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: MINIMUM_ROW..MAXIMUM_ROW }, uniqueness: true
end
