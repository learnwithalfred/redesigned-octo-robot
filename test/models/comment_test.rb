# frozen_string_literal: true

require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
    @classroom = create(:classroom)
    @subject = create(:subject)
    @course = create(:course, user: @user, classroom: @classroom, subject: @subject)
    @comment = create(:comment, user: @user, course: @course)
  end

  def test_comment_should_be_valid_with_all_fields_filled
    assert @comment.valid?
    assert @comment.save
  end

  def test_comment_should_not_be_valid_without_user_id
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  def test_commemt_should_not_be_valid_without_course_id
    @comment.course_id = nil
    assert_not @comment.valid?
  end

  def test_comment_length_should_not_be_negetive
    @comment.content = ""
    assert_not @comment.valid?
  end

  def test_comment_length_must_not_exceed_500_characters
    @comment.content = "a" * 501
    assert_not @comment.valid?
  end
end
