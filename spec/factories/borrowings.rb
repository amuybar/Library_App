FactoryBot.define do
    factory :borrowing do
      association :user
      association :book
      returned_at { nil }
    end
  end
  