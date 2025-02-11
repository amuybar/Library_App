
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'User created successfully!'
    else
      render :new
    end
  end
  def show
    @borrowings = current_user.borrowings.where(returned_at: nil)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end