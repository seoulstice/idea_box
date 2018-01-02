FactoryBot.define do
  factory :genre do
    sequence(:classification) { |n| "Work#{n}" }
  end
end
