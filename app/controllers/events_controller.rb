class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    event.save!
    @events = Event.where(user_id: current_user.id)
  end

  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to user_path(current_user)
  end

  private
  def event_params
    data = params.require(:event).permit(:title, :start, :end, :user_id, :body, :day_image)
    # カレンダー表記のため、変数を使いendの終了時間を定義、デフォルトで00：00
    data[:end] = data[:end] + " 23:59:59"
    return data
  end
end
