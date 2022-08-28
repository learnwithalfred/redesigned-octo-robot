# frozen_string_literal: true

FactoryBot.define do
  factory :subject do
    name { Faker::Lorem.words(number: 5) }
  end
end
