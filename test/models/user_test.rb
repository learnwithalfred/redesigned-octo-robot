# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "John Doe", email: "john@doe.com", password: "welcome", password_confirmation: "welcome",
      gender: "male", address: "ksi")
  end

  def test_user_should_not_be_valid_and_saved_without_name
    @user.name = ""
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Name can't be blank"
  end

  def test_name_should_be_of_valid_length
    @user.name = "a" * (User::MAX_NAME_LENGTH + 1)
    assert @user.invalid?
  end

  def test_user_should_not_be_valid_and_saved_without_email
    @user.email = ""
    assert_not @user.valid?

    @user.save
    assert_includes @user.errors.full_messages, "Email can't be blank", "Email is invalid"
  end

  def test_user_should_not_be_valid_and_saved_if_email_not_unique
    @user.save!

    test_user = @user.dup
    assert_not test_user.valid?

    assert_includes test_user.errors.full_messages, "Email has already been taken"
  end

  def test_reject_email_of_invalid_length
    @user.email = ("a" * User::MAX_EMAIL_LENGTH) + "@test.com"
    assert @user.invalid?
  end

  def test_email_should_be_saved_in_lowercase
    uppercase_email = "SAM@EMAIL.COM"
    @user.email = uppercase_email
    @user.save!
    assert_equal uppercase_email.downcase, @user.email
  end

  def test_user_should_not_be_saved_without_password
    @user.password = nil
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Password can't be blank"
  end

  def test_user_should_not_be_saved_without_password_confirmation
    @user.password_confirmation = nil
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Password confirmation can't be blank"
  end

  def test_user_should_have_matching_password_and_password_confirmation
    @user.password_confirmation = "#{@user.password}-random"
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Password confirmation doesn't match Password"
  end

  def password_length_must_be_between_6_and_50
    @user.password = "a" * 5
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Password is too short (minimum is 6 characters)"
  end

  def password_length_must_not_exceed_50_characters
    @user.password = "a" * 51
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Password is too long (maximum is 50 characters)"
  end

  def test_email_should_be_saved_in_lowercase
    uppercase_email = "SAM@EMAIL.COM"
    @user.email = uppercase_email
    @user.save!
    assert_equal uppercase_email.downcase, @user.email
  end

  def test_user_role_should_be_user_by_default
    assert_equal "user", @user.role
  end

  def test_user_should_not_be_created_without_a_gender
    @user.gender = nil
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Gender can't be blank"
  end

  def test_user_should_be_valid_without_address
    @user.address = nil
    assert @user.valid?
  end
end
