# frozen_string_literal: true

require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = Subject.create(
      name: "test subject"
    )

  end

  test "should get index" do
    get subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_url
    assert_response :success
  end

  test "should create subject" do
    assert_difference("Subject.count") do
      post subjects_url, params: { subject: { name: "test subject 2" } }
    end

    assert_redirected_to subject_url(Subject.last)
  end

  test "should show subject" do
    get subject_url(@subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { name: "test subject 3" } }
    assert_redirected_to subject_url(@subject)
  end

  test "should destroy subject" do
    assert_difference("Subject.count", -1) do
      delete subject_url(@subject)
    end

    assert_redirected_to subjects_url
  end

  def test_subject_must_have_name
    assert_difference("Subject.count", 0) do
      post subjects_url, params: { subject: { name: "" } }
    end

    assert_response :unprocessable_entity
  end
end
