# frozen_string_literal: true

require 'rails_helper'

# RSpec.describe 'event新規登録', type: :system do
#   # テスト用データを読み込む
#   before do
#     @event = FactoryBot.build(:event)
#     @user = FactoryBot.create(:user)
#   end. 13.14行目の記述があるので、必要なし。

describe '投稿のテスト' do
  let!(:event) { create(:event, user_id: user.id, title:'hoge',body:'body')}
  let!(:user) { create(:user,name:'hoge',birthday:'1995-03-03')}
  describe 'マイページのテスト' do
    before do
      sign_in(user) 
      visit user_path(user)
    end
    context '表示の確認' do
      it '誕生日が表示されているか' do
        expect(page).to have_content '誕生日'
      end
    end
  end
end

# jsを使ったテストができるよう設定する必要がある。
describe '投稿画面のテスト', js: true do
  let!(:event) { create(:event, user_id: user.id, title:'hoge',body:'body')}
  let!(:user) { create(:user,name:'hoge',birthday:'1995-03-03')}
  before do
    sign_in(user)
    visit user_path(user)
  end
  context '表示の確認' do
    it 'expect' do
      p page.html
      expect(page).to have_selector('input[value="登録する"]', visible: true)
    end
  end
end

# expect().to　の部分はエクスぺテーションと呼ばれる,()内の値が期待値となるように,という意味がある
# be_valid　の部分はマッチャーと呼ばれ様々な種類がある
# be_valid　は値が有効であるかを判断するマッチャー
