# app/models/borrowing.rb
class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :book_availability, on: :create

  before_create :set_due_date

  private

  def set_due_date
    self.due_date = 2.weeks.from_now
  end

  def book_availability
    errors.add(:book, 'is already borrowed') if book.borrowed?
  end
end