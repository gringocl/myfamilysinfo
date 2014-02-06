class KidsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @kid = Kid.new
    @kid.relationships.build
  end

  def create
     new_params = kid_params.merge("relationships_attributes" => { "0" => {"user_id" => current_user.id}})
     nested_params = kid_params.deep_merge(new_params)
     @kid = Kid.create(nested_params)
    if @kid.save
      format.html { redirect_to user_path, :notice => "Successfully created place" }
      format.js   # renders create.js.erb, which could be used to redirect via javascript
    else
      format.html { render :action => 'new' }
      format.js { render :action => 'new' }
    end
     # authorize @kid
     #redirect_to user_path, notice: "#{@kid.name} was added your account"
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy
    redirect_to user_path, notice: "#{@kid.name} was removed from your account"
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



def create
  @place = Place.new(params[:place])

  respond_to do |format|
    if @place.save
      format.html { redirect_to places_path, :notice => "Successfully created place" }
      format.js   # renders create.js.erb, which could be used to redirect via javascript
    else
      format.html { render :action => 'new' }
      format.js { render :action => 'new' }
    end
  end
end
