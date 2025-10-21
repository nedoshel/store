FactoryBot.define do
  factory :wishlist do
    user { nil }
    name { "MyString" }
    products_count { 1 }
  end
end
