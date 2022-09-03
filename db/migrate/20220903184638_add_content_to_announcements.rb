# frozen_string_literal: true

class AddContentToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :content, :text
  end
end
