FactoryBot.define do
  factory :address do
    listing { nil }
    state { "MyString" }
    postcode { 1 }
    suburb { "MyString" }
    street_name { "MyString" }
    street_number { 1 }
  end
end
