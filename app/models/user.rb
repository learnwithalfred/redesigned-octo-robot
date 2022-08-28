# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  MAX_EMAIL_LENGTH = 50
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

  before_save :to_lowercase

  enum role: [:user, :learner, :staff, :admin, :head_teacher, :teacher, :super_admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role # set default role to user  if not set
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  private

    def to_lowercase
      email.downcase!
    end
end
