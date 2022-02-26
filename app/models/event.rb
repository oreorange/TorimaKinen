class Event < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy
  # ユーザーがいいねしているかどうか判断、存在（exists?）
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  attachment :day_image
  
  validates :title, length: { maximum: 50, minimum: 1}
  validates :start, presence: true
  # validates :end, presence: true  開始日だけでも大丈夫

  # 検索のためのメソッド定義
  def self.search_for(content, method)
    if method == 'perfect'
      Event.where(title: content)
    elsif method == 'forward'
      Event.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Event.where('title LIKE ?', '%' + content)
    else
      Event.where('title LIKE ?', '%' + content + '%')
    end
  end
end
