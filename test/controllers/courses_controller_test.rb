# frozen_string_literal: true

require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(
      name: "John Doe", email: "admin@doe.com", password: "welcome", password_confirmation: "welcome",
      role: "admin", gender: "male", address: "ksi")
    sign_in(@user)
    @classroom = create(:classroom)
    @subject = create(:subject)
    @course = create(:course, user: @user, classroom: @classroom, subject: @subject)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference("Course.count") do
      post courses_url,
        params: {
          course: {
            classroom_id: @classroom.id, course_date: @course.course_date, status: "pending",
            subject_id: @subject.id, title: "a new course", user_id: @user.id, content: "this is a new course content"
          }
        }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course),
      params: {
        course: {
          classroom_id: @course.classroom_id, course_date: @course.course_date, status: @course.status,
          subject_id: @course.subject_id, title: @course.title, user_id: @course.user_id
        }
      }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
