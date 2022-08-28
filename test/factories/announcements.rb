# frozen_string_literal: true

FactoryBot.define do
  factory :announcement do
    title { Faker::Lorem.words(number: 5) }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
