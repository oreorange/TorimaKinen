class Event < ApplicationRecord
  belongs_to :user
  attachment :day_image
  
  # 検索のためのメソッド定義
  def self.search_for(content, method)
    if method == 'perfect'
      Event.where(title: content)
    elsif method == 'forward'
      Event.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Event.where('title LIKE ?', '%'+content)
    else
      Event.where('title LIKE ?', '%'+content+'%')
    end
  end
  
end
