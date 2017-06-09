class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to account_users_path
      flash[:notice] = "个人资料修改成功"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :province, :city,
    :district, :address, :tel)
  end
end
