class KidsController < ApplicationController
  def new
    @user = current_user
    @kid = Kid.new
    @kid.relationships.build
  end

  def create
     @kid = Kid.create(kid_params)
     #@relationship = Relationship.create(kid_id: @kid.id, user_id: current_user.id)
  end



  private
    def kid_params
      params.require(:kid).permit(:name, :user_id, relationships_attributes: [:role, :user_id])
    end
end



