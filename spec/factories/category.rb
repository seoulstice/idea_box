FactoryBot.define do
  factory :category do
    sequence(:classification) { |n| "Work#{n}" }
  end
end
