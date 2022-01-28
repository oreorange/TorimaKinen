FactoryBot.define do
  factory :user do
    name              { 'Yuki' }
    email                 { Faker::Internet.free_email }
    password              { 'test888' }
    password_confirmation { password }
    family_name           { '山田' }
    given_name            { '裕貴' }
    birth_day             { '1990-05-10' }
  end
end

# Faker:: ：Fakerを使用する時の宣言
# Lorem：ダミーテキストタイプを選択　※Lorem=lorem ipsumの略でダミーテキストの意味
# characters：文字列を作成
# number：生成文字数の指定