# frozen_string_literal: true

require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      name: "John Doe", email: "admin@doe.com", password: "welcome", password_confirmation: "welcome",
      role: "admin", gender: "male", address: "ksi")
    sign_in(@user)
    @announcement = Announcement.create(
      title: "test title",
      content: "test content"
    )
  end

  test "should get index" do
    get announcements_url
    assert_response :success
  end

  test "should get new" do
    get new_announcement_url
    assert_response :success
  end

  test "should create announcement" do
    assert_difference("Announcement.count") do
      post announcements_url, params: { announcement: { title: "test title 2", content: "test content 2" } }
    end

    assert_redirected_to announcement_url(Announcement.last)
  end

  test "should show announcement" do
    get announcement_url(@announcement)
    assert_response :success
  end

  test "should get edit" do
    get edit_announcement_url(@announcement)
    assert_response :success
  end

  test "should update announcement" do
    patch announcement_url(@announcement),
      params: { announcement: { title: "test title 3", content: "test content 3" } }
    assert_redirected_to announcement_url(@announcement)
  end

  test "should destroy announcement" do
    assert_difference("Announcement.count", -1) do
      delete announcement_url(@announcement)
    end

    assert_redirected_to announcements_url
  end

  def test_announcement_must_have_title
    assert_difference("Announcement.count", 0) do
      post announcements_url, params: { announcement: { title: "", content: "test content 3" } }
    end

    assert_response :unprocessable_entity
  end

  def test_announcement_must_have_content
    assert_difference("Announcement.count", 0) do
      post announcements_url, params: { announcement: { title: "test title 3", content: "" } }
    end

    assert_response :unprocessable_entity
  end
end
