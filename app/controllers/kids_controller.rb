class KidsController < ApplicationController

  def index
    @kid = Kid.all
  end

  def new
    @user = current_user
    @kid = Kid.new
    @kid.relationships.build
  end

  def create
     new_params = kid_params.merge("relationships_attributes" => { "0" => {"user_id" => current_user.id}})
     nested_params = kid_params.deep_merge(new_params)
     @kid = Kid.create(nested_params)
     redirect_to current_user
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy notice: "Kid Removed"
    redirect_to current_user
  end

  private
    def kid_params
      params.require(:kid).permit(:name, :user_id, relationships_attributes: [:role, :user_id])
    end
end



