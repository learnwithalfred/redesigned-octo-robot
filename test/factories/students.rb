# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    dob { "1990-08-23" }
    contact { "MyString" }
    father { "MyString" }
    mother { "MyString" }
    about { "MyText" }
    user_id { 1 }
    classroom_id { 1 }
  end
end
