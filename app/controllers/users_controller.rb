class UsersController < ApplicationController
  before_filter :authenticate_user!


  def show
    @user = !params[:id].nil? ? User.find(params[:id]) :current_user
  end

end
