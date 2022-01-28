# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:event) { create(:event,title:'hoge',body:'body')}
  describe 'マイページのテスト' do
    before do
      visit user_path(current_user)
    end
    context '表示の確認' do
      it '誕生日が表示されているか' do
        expect(page).to have_content '誕生日'
      end
    end
  end
end

# expect().to　の部分はエクスぺテーションと呼ばれる,()内の値が期待値となるように,という意味がある
# be_valid　の部分はマッチャーと呼ばれ様々な種類がある
# be_valid　は値が有効であるかを判断するマッチャー
