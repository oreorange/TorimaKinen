FactoryBot.define do
  factory :event do
    start { '2022-03-09' }
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
  end
end

# Faker:: ：Fakerを使用する時の宣言
# Lorem：ダミーテキストタイプを選択　※Lorem=lorem ipsumの略でダミーテキストの意味
# characters：文字列を作成
# number：生成文字数の指定
