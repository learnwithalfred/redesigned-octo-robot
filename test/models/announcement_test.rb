# frozen_string_literal: true

require "test_helper"

class AnnouncementTest < ActiveSupport::TestCase
  def setup
    @announcement = create(:announcement)
  end

  def test_announcemnt_should_be_valid_with_title_and_content
    assert @announcement.valid?
  end

  def test_announcemnt_should_not_be_valid_without_title
    @announcement.title = nil
    assert_not @announcement.valid?
  end

  def test_announcemnt_should_not_be_valid_without_content
    @announcement.content = nil
    assert_not @announcement.valid?
  end

  def test_announcement_length_should_be_within_range
    @announcement.title = "a" * (Announcement::MIN_LENGTH - 1)
    assert_not @announcement.valid?
  end

  def test_announcement_length_should_not_exceed_range
    @announcement.title = "a" * (Announcement::MAX_LENGTH + 1)
    assert_not @announcement.valid?
  end
end
