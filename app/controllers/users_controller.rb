class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = !params[:id].nil? ? User.find(params[:id]) :current_user
  end

end
class Notification < ActiveRecord::Base
  belongs_to :notifiable, polymorphic: true
end

class Guardian < ActiveRecord::Base
  has_many :notifications, as: :notifiable
end

class Ward < ActiveRecord::Base
  has_many :notifications, as: :notifiable
end
