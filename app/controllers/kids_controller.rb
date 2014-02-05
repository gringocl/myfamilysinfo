class KidsController < ApplicationController
  def new
    @user = current_user
    @kid = Kid.new
    @kid.relationships.build
  end

  def create
     new_params = kid_params.merge("relationships_attributes" => { "0" => {"user_id" => current_user.id}})
     nested_params = kid_params.deep_merge(new_params)
     @kid = Kid.create(nested_params)
     #@relationship = Relationship.create(kid_id: @kid.id, user_id: current_user.id)
  end



  private
    def kid_params
      params.require(:kid).permit(:name, relationships_attributes: [:role, :user_id])
    end
end



