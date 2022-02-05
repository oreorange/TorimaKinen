class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    # Natural Languat API使用
    event.score = Language.get_data(event_params[:title])  #この行を追加
    event.save!
    @events = Event.where(user_id: current_user.id)
    # vision api使用 画像がない場合はタグを作らない表示しない
    if event.day_image
      tags = Vision.get_image_data(event.day_image)
    else
      tags = []
    end
    tags.each do |tag|
      event.tags.create(name: tag)
    end
    
  end

  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
    # vision api使用 画像がない場合はタグを作らない表示しない
    if event.day_image
      tags = Vision.get_image_data(event.day_image)    
    else
      tags = []
    end
    tags.each do |tag|
      event.tags.create(name: tag)
    end
    
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
