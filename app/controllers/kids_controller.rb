class KidsController < ApplicationController
  def new
    @kid = Kid.new
  end
end

#   def create
#     @kid = kid(kid_params)
#     @relationship = Relationship.new { kid: @kid, user: current_user, role: "father"}
#     @kid.save
#     @relationship.save
#   end


#   private

#   def kid_params
#     params.require(:kid).permit(:name, :family_id)
#   end
# end

