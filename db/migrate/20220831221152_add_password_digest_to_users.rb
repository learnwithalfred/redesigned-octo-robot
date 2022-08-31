# frozen_string_literal: true

class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :authentication_token, :string
  end
end
