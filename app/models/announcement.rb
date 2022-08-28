# frozen_string_literal: true

class Announcement < ApplicationRecord
  MIN_LENGTH = 3
  MAX_LENGTH = 255

  validates :title, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :content, presence: true
  has_rich_text :content
end
