class UsersController < ApplicationController

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def create
  #   @user = User.new(user_params)
  #   #バリデーションで問題があれば、保存はされず「登録画面」に戻る
  #   if @user.save
  #     redirect_to controller: :users, action: :index
  #   else
  #     render "new"
  #   end
  # end

  # def index
  # end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date)
  end
end
