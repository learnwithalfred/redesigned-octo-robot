# frozen_string_literal: true

require "test_helper"

class ClassroomTest < ActiveSupport::TestCase
  def setup
    @classroom = build(:classroom)
  end

  def test_classroom_should_be_valid_and_saved_with_name
    assert @classroom.valid?
    assert @classroom.save
  end

  def test_classroom_should_not_be_valid_and_saved_without_name
    @classroom.name = nil
    assert_not @classroom.valid?
    assert_includes @classroom.errors.full_messages, "Name can't be blank"
  end

  def test_classroom_should_be_valid_and_saved_without_role
    @classroom.role = nil
    assert_not @classroom.valid?
    assert_includes @classroom.errors.full_messages, "Role can't be blank"
  end

  def test_role_must_not_exceed_30
    @classroom.role = Classroom::MAXIMUM_ROW + 1
    assert_not @classroom.valid?
    assert_includes @classroom.errors.full_messages, "Role is not included in the list"
  end

  def test_role_must_not_be_negative
    @classroom.role = -1
    assert_not @classroom.valid?
    assert_includes @classroom.errors.full_messages, "Role is not included in the list"
  end
end
