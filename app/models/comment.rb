# frozen_string_literal: true

class Comment < ApplicationRecord
  CONTENT_LENGTH = 1..500

  belongs_to :course
  belongs_to :user

  validates :content, presence: true, length: { in: CONTENT_LENGTH }
end
