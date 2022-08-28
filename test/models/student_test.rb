# frozen_string_literal: true

require "test_helper"

class StudentTest < ActiveSupport::TestCase
  def setup
    @classroom = create(:classroom)
    @user = create(:user)
    @student = create(:student, user: @user, classroom: @classroom)
  end

  def test_student_should_be_valid_with_all_fields_filled
    assert @student.valid?
    assert @student.save
  end

  def test_student_should_not_be_valid_without_user_id
    @student.user_id = nil
    assert_not @student.valid?
  end

  def test_student_should_not_be_valid_without_classroom_id
    @student.classroom_id = nil
    assert_not @student.valid?
  end

  def test_student_should_not_be_valid_without_dob
    @student.dob = nil
    assert_not @student.valid?
  end

  def test_student_should_not_be_valid_without_contact
    @student.contact = nil
    assert_not @student.valid?
  end

  def test_student_should_not_be_valid_without_father
    @student.father = nil
    assert_not @student.valid?
  end

  def test_student_should_not_be_valid_without_mother
    @student.mother = nil
    assert_not @student.valid?
  end

  def test_student_should_not_be_valid_without_about
    @student.about = nil
    assert_not @student.valid?
  end
end
