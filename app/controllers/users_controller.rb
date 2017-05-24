class UsersController < ApplicationController

  def search
    @users = User.where("name LIKE(?)", "%#{user_params[:name]}%")
    respond_to do |format|
      format.json
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
