# app/models/book.rb
class Book < ApplicationRecord
    has_many :borrowings
    has_many :users, through: :borrowings
    
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true

    def borrowed?
        borrowings.where(returned_at: nil).exists?
    end
  end