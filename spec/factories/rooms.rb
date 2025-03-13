FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "Room #{n}" }
    description { "A test room" }
  end
end 