# frozen_string_literal: true

class Course < ApplicationRecord
  MIN_LENGTH = 3
  MAX_LENGTH = 255

  belongs_to :user
  belongs_to :classroom
  belongs_to :subject
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :content, presence: true
  validates :course_date, presence: true

  validates :status, presence: true, inclusion: { in: %w(pending active archived) }
  has_rich_text :content

  validates :user_id, presence: true
  validates :classroom_id, presence: true
  validates :subject_id, presence: true
end
