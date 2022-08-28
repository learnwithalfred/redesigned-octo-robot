# frozen_string_literal: true

require "test_helper"

class ClassroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      name: "John Doe",
      email: "admin@doe.com",
      password: "welcome",
      password_confirmation: "welcome",
      role: "admin",
      gender: "male",
      address: "ksi")
    sign_in(@user)
    @classroom = Classroom.create(name: "test classroom 2", role: 5)
  end

  test "should get index" do
    get classrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_classroom_url
    assert_response :success
  end

  test "should create classroom" do
    assert_difference("Classroom.count") do
      post classrooms_url, params: { classroom: { name: "Classroom 2", role: 4 } }
    end

    assert_redirected_to classroom_url(Classroom.last)
  end

  test "should show classroom" do
    get classroom_url(@classroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_classroom_url(@classroom)
    assert_response :success
  end

  test "should update classroom" do
    patch classroom_url(@classroom),
      params: { classroom: { name: @classroom.name, role: @classroom.role } }
    assert_redirected_to classroom_url(@classroom)
  end

  test "should destroy classroom" do
    assert_difference("Classroom.count", -1) do
      delete classroom_url(@classroom)
    end

    assert_redirected_to classrooms_url
  end

  # def test_classroom_should_not_be_destroyed_if_it_has_students
  #   @classroom.students.create(name: "test student", role: 1)
  #   assert_difference('Classroom.count', 0) do
  #     delete classroom_url(@classroom)
  #   end

  #   assert_redirected_to classrooms_url
  # end

  def test_classroom_must_have_name
    assert_difference("Classroom.count", 0) do
      post classrooms_url, params: { classroom: { name: "", role: 4 } }
    end

    assert_response :unprocessable_entity
  end

  def test_classroom_must_have_role
    assert_difference("Classroom.count", 0) do
      post classrooms_url, params: { classroom: { name: "Classroom 2", role: nil } }
    end

    assert_response :unprocessable_entity
  end
end
