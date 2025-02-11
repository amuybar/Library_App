# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    title { "Test Book" }
    author { "John Doe" }
    isbn { "1234567890" }
  end
end
