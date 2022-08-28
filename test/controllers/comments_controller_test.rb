# frozen_string_literal: true

require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    sign_in(@user)
    @classroom = create(:classroom)
    @subject = create(:subject)
    @course = create(:course, user: @user, classroom: @classroom, subject: @subject)
    @comment = create(:comment, user: @user, course: @course)
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post comments_url,
        params: { comment: { content: @comment.content, course_id: @comment.course_id, user_id: @comment.user_id } }
    end

    assert_redirected_to @comment.course
  end
end
