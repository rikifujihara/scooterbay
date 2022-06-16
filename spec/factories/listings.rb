FactoryBot.define do
  factory :listing do
    title { "MyString" }
    brand { "MyString" }
    price { 1 }
    description { "MyText" }
    sold { false }
    in_built_lighting { false }
    double_motor { false }
    pneumatic_tires { false }
    has_suspension { false }
    user { nil }
  end
end
