# frozen_string_literal: true

class Subject < ApplicationRecord
  MAX_SUBJECT_LENGTH = 100
  MIMIMUM_SUBJECT_LENGTH = 3

  validates :name, presence: true, uniqueness: true,
    length: { minimum: MIMIMUM_SUBJECT_LENGTH, maximum: MAX_SUBJECT_LENGTH }
end
