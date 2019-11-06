class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    if is_acces(params[:id])
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    #current_user
  end

  private

  def is_acces(id)
    if current_user.id == id
      returne true
    end
  end

end
