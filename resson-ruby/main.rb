require_relative './qiita'
require_relative 'greetable'

# qiita = Qiita.new("Python")
# q = qiita.search
# p q
#
# qiita.query = "java"
# p qiita.query
# p qiita.search

# Q3. コードを書く問題
# 以下の要件を満たすメソッドを書いてください。
# 要件
#
# メソッド名は total_price
# 引数として「商品名と価格のHash」を受け取る（例: {apple: 100, banana: 50, grape: 200}）
# ただし、価格が100以上の商品だけを対象に合計金額を計算して返す
#
# 期待される動作
# rubytotal_price({apple: 100, banana: 50, grape: 200})
# # => 300  (apple:100 + grape:200。bananaは100未満なので除外)
# ヒント: 前回使った select と reduce（または sum）が使えます。Hashに対してreduceやsumを使うときは、ブロック引数の受け取り方に注意してください。
# 自分で書いてみてください！
#

def total_price(hash)
  hash.select { |k, v| v >= 100 }.sum { |k, v| v }
end

# Q4. クラスの基礎
# 以下の要件でクラスを作ってください。
# 要件
#
# クラス名は Product
# name（商品名）と price（価格）を持つ
# インスタンス作成時に name と price を渡せる（例: Product.new("apple", 100)）
# name と price は外部から読み取れる（product.name や product.price が使える）
# expensive? というメソッドを持ち、price が150以上なら true を返す
#
# 期待される動作
# rubyp = Product.new("grape", 200)
# puts p.name        # => "grape"
# puts p.price        # => 200
# puts p.expensive?   # => true
# ヒント: 「外部から読み取れる」という部分で、Rubyらしい便利な書き方（attr_readerなど）を知っているか試してみてください。知らなければdef name; @name; endのような書き方でも構いません。まずは自分で書いてみましょう。

class Product
  attr_reader :name, :price

  include Greetable

  def initialize(name, price)
    @name = name
    @price = price
  end

  def expensive?
    @price >= 150
  end
end

class DiscountProduct < Product

  def initialize(name, price, discount_rate)
    super(name, price)
    @discount_rate = discount_rate
  end

  def final_price
    price * (1 - @discount_rate)
  end
end

def divide(a, b)
  begin
    a / b
  rescue ZeroDivisionError
    "Cannot divide by zero"
  end
end

#{良い判断です。「便利メソッドの引き出し」を増やす練習をしましょう。実務でよく使うものを、実際の使用シーンとセットで出していきます。

# Q8. group_by
# 以下の配列があります。
# rubyproducts = [
#   { name: "apple", category: "fruit" },
#   { name: "carrot", category: "vegetable" },
#   { name: "banana", category: "fruit" },
#   { name: "potato", category: "vegetable" }
# ]
# これを使って、カテゴリーごとに商品名をまとめたHashを作ってください。
# 期待される出力
# ruby{
#   "fruit" => ["apple", "banana"],
#     "vegetable" => ["carrot", "potato"]
# }
# 使用シーン: 「カテゴリ別に一覧表示したい」「ユーザーを部署ごとにグループ化したい」など、実務でかなり頻出のパターンです。
# ヒント: group_byというメソッドが使えます。まずgroup_byだけを使った場合にどんな形になるか試してみて、そこからnameだけを取り出す処理を追加してみてください。知らなければ、まずselectやmapを組み合わせる方法で挑戦してみても構いません（その後にgroup_byを紹介します）。
# 自分で書いてみてください！}}

rubyproducts = [
  { name: "apple", category: "fruit" },
  { name: "carrot", category: "vegetable" },
  { name: "banana", category: "fruit" },
  { name: "potato", category: "vegetable" }
]

puts rubyproducts.group_by

# わかりました！次は flat_map を練習しましょう。
#
# Q9. flat_map
# 以下の配列があります。
rubyorders = [
  { user: "Alice", items: ["apple", "banana"] },
  { user: "Bob", items: ["grape", "potato", "carrot"] },
  { user: "Carol", items: ["banana", "apple"] }
]
# 全ユーザーの購入商品を1つの配列にまとめて、重複を除いた一覧を作ってください。
# 期待される出力
# ruby["apple", "banana", "grape", "potato", "carrot"]
# ヒント:
#
#   mapだと配列の中に配列が入ってしまいます（[["apple", "banana"], ["grape"...], ...]）
# flat_mapはmapしてから1段階フラットに展開してくれます
# 重複を除くにはuniqが使えます
#
# 自分で書いてみてください！






