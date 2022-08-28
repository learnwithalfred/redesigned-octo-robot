# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    course_date { "2022-08-24 09:18:04" }
    status { "pending" }
    title { "MyString" }
    content { "my string" }
  end
end
