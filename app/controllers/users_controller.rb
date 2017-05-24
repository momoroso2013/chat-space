class UsersController < ApplicationController

  def search
    @users = User.search(user_params)
    respond_to do |format|
      format.json
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
