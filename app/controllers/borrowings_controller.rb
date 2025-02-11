# app/controllers/borrowings_controller.rb
class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @borrowing = current_user.borrowings.new(book: @book)

    if @borrowing.save
      redirect_to profile_path, notice: 'Book borrowed successfully!'
    else
      redirect_to book_path(@book), alert: @borrowing.errors.full_messages.join(', ')
    end
  end

  def return
    @borrowing = Borrowing.find(params[:id])
    @borrowing.update(returned_at: Time.current)
    redirect_to profile_path, notice: 'Book returned successfully!'
  end
end