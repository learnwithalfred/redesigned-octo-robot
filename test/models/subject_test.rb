# frozen_string_literal: true

require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  def setup
    @subject = create(:subject)
  end

  def test_subject_should_be_valid_and_saved_with_name
    assert @subject.valid?
    assert @subject.save
  end

  def test_subject_should_not_be_valid_and_saved_without_name
    @subject.name = nil
    assert_not @subject.valid?
    assert_includes @subject.errors.full_messages, "Name can't be blank"
  end

  def test_subject_should_not_be_valid_and_saved_with_too_long_name
    @subject.name = "a" * (Subject::MAX_SUBJECT_LENGTH + 1)
    assert_not @subject.valid?
    assert_includes @subject.errors.full_messages, "Name is too long (maximum is 100 characters)"
  end

  def test_subject_should_not_be_valid_and_saved_with_too_short_name
    @subject.name = "a" * (Subject::MIMIMUM_SUBJECT_LENGTH - 1)
    assert_not @subject.valid?
    assert_includes @subject.errors.full_messages, "Name is too short (minimum is 3 characters)"
  end

  def test_subject_name_must_be_unique
    subject_2 = Subject.create(name: "subject 1")
    subject_3 = Subject.create(name: "subject 1")
    assert_not subject_3.valid?
    assert_includes subject_3.errors.full_messages, "Name has already been taken"
  end
end
