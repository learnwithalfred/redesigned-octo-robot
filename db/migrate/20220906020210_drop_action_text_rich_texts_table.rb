# frozen_string_literal: true

class DropActionTextRichTextsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :action_text_rich_texts do |t|
      t.string :name, null: false
      t.text :body, size: :long
      t.references :record, null: false, polymorphic: true, index: false, type: foreign_key_type

      t.timestamps
    end
  end
end
