class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = !params[:id].nil? ? User.find(params[:id]) :current_user
  end

end
