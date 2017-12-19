FactoryBot.define do
  factory :user do
    name "John"
    email  "JohnDoe@123.com"
    password "123"
    admin false
  end
end
