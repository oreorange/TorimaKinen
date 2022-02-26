# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, "モデルに関するテスト", type: :model do
  let(:user) { FactoryBot.create(:user) }
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:event, user_id: user.id)).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    context 'titleカラム' do
      it '空欄でないこと' do
        event.title = ''
        is_expected.to eq false
      end
      it '50文字以下であること: 50文字は〇' do
        event.title = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end
      it '50文字以下であること: 51文字は×' do
        event.title = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
  end

end

# expect().to　の部分はエクスぺテーションと呼ばれる,()内の値が期待値となるように,という意味がある
# be_valid　の部分はマッチャーと呼ばれ様々な種類がある
# be_valid　は値が有効であるかを判断するマッチャー
