FactoryBot.define do
  factory :movie do
    title { "MyString" }
    synopsis { "MyText" }
    year { 1 }
    duration { 1 }
    director { "MyString" }
    user { nil }
  end
end
