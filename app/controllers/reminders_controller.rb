class RemindersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @kid = Kid.find(params[:kid_id])
    @reminder = @kid.reminders.build
  end

  def create
    @kid = Kid.find(params[:kid_id])
    @reminder = @kid.reminders.create(reminder_params)
    if @reminder.save
      redirect_to user_path, notice: "#{@reminder.name} added for #{@kid.name}!"
    else
      render :new
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.touch
    redirect_to user_path, notice: "#{@reminder.name} reminder was updated!"
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    redirect_to user_path, notice: "#{@reminder.name} reminder was deleted!"
  end

  private
    def reminder_params
      params.require(:reminder).permit(:name, :kid_id)
    end
end

