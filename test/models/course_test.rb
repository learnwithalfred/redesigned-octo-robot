# frozen_string_literal: true

require "test_helper"

class CourseTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
    @classroom = create(:classroom)
    @subject = create(:subject)
    @course = create(:course, user: @user, classroom: @classroom, subject: @subject)
  end

  def test_course_should_be_valid_with_all_fields_filled
    assert @course.valid?
    assert @course.save
  end

  def test_course_should_not_be_valid_without_user_id
    @course.user_id = nil
    assert_not @course.valid?
  end

  def test_course_should_not_be_valid_without_classroom_id
    @course.classroom_id = nil
    assert_not @course.valid?
  end

  def test_course_should_not_be_valid_without_subject_id
    @course.subject_id = nil
    assert_not @course.valid?
  end

  def test_course_should_not_be_valid_without_status
    @course.status = nil
    assert_not @course.valid?
  end

  def test_course_should_not_be_valid_without_course_date
    @course.course_date = nil
    assert_not @course.valid?
  end

  def test_course_should_not_be_valid_without_content
    @course.content = nil
    assert_not @course.valid?
  end
end
