class KidsController < ApplicationController
  def new
    @user = current_user
    @kid = Kid.new
  end

  def create
     @kid = Kid.create(kid_params)
     @relationship = Relationship.create(kid: @kid, user: current_user)
     @kid.save
     @relationship.save
     redirect_to current_user_path
   end



   private
     def kid_params
      params.require(:kid).permit(:name, :family_id, relationship_attributes: [:role])

     end
 end

