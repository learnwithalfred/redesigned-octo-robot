# frozen_string_literal: true

require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classroom = create(:classroom)
    @user = User.create(
      name: "John Doe", email: "admin@doe.com", password: "welcome", password_confirmation: "welcome",
      role: "admin", gender: "male", address: "ksi")
    @user2 = create(:user)
    @user3 = create(:user)
    @student = create(:student, user: @user2, classroom: @classroom)
    sign_in(@user)
  end

  test "should get index" do
    get students_path
    assert_response :success

  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do

    assert_difference("Student.count") do
      post students_url,
        params: {
          student: {
            about: "i like to learn", classroom_id: @classroom.id, contact: "hello", dob: @student.dob,
            father: @student.father, mother: @student.mother, user_id: @user3.id
          }
        }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)

    assert_response :success
  end

  test "should update student" do
    patch student_url(@student),
      params: {
        student: {
          about: "about me has changed", classroom_id: @student.classroom_id, contact: "1990-09-09",
          dob: "1990-09-09", father: "ken", mother: "john", user_id: @student.user_id
        }
      }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
