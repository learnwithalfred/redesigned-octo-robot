# frozen_string_literal: true

require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "should create course" do
    visit courses_url
    click_on "New course"

    fill_in "Classroom", with: @course.classroom_id
    fill_in "Course date", with: @course.course_date
    fill_in "Status", with: @course.status
    fill_in "Subject", with: @course.subject_id
    fill_in "Title", with: @course.title
    fill_in "User", with: @course.user_id
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "should update Course" do
    visit course_url(@course)
    click_on "Edit this course", match: :first

    fill_in "Classroom", with: @course.classroom_id
    fill_in "Course date", with: @course.course_date
    fill_in "Status", with: @course.status
    fill_in "Subject", with: @course.subject_id
    fill_in "Title", with: @course.title
    fill_in "User", with: @course.user_id
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "should destroy Course" do
    visit course_url(@course)
    click_on "Destroy this course", match: :first

    assert_text "Course was successfully destroyed"
  end
end
