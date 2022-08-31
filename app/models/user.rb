# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  MAX_EMAIL_LENGTH = 255
  PASSWORD_LENGTH = 6..50
  MAX_NAME_LENGTH = 35

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :gender, presence: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: MAX_EMAIL_LENGTH },
    format: { with: VALID_EMAIL_REGEX }
  validates :password,
    presence: true,
    confirmation: true,
    length: { in: PASSWORD_LENGTH }
  validates :password_confirmation, presence: true, on: :create

  has_one :student
  has_many :courses
  has_many :comments, dependent: :destroy
  before_save :to_lowercase
  has_secure_password
  has_secure_token :authentication_token

  enum role: [:user, :learner, :staff, :admin, :head_teacher, :teacher, :super_admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role # set default role to user  if not set
    self.role ||= :user
  end

  private

    def to_lowercase
      email.downcase!
    end
end
