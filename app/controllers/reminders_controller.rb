class RemindersController < ApplicationController
  def index
    redirect_to(new_user_kid_reminder_path)
  end
  def new
    @kid = Kid.find(params[:kid_id])
    @reminder = @kid.reminders.build
    #respond_with(@reminder)
  end
  def create
    @kid = Kid.find(params[:kid_id])
    @reminder = @kid.reminders.create(reminder_params)
    if @reminder.save
      redirect_to current_user, notice: "Updated"
    else
      render :new
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.touch
    redirect_to current_user, notice: "Updated!"
  end
  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy notice: "Reminder Removed"
    redirect_to current_user
  end

private

  def reminder_params
    params.require(:reminder).permit(:name, :kid_id)
  end
end

