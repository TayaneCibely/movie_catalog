FactoryBot.define do
  factory :comment do
    content { "MyText" }
    commenter_name { "MyString" }
    movie { nil }
    user { nil }
  end
end
