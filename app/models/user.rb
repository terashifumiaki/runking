class User < ApplicationRecord
  before_save { self.email.downcase! }
  # before_save { self.email.downcase! } があります。これは、User インスタンス（レコード）を保存するその前に、self.email.downcase! を実行するというもの
  # self.email.downcase! は、文字を全て小文字に変換するというものです。! をつけることで、自分自身を直接変換します（このようなメソッドの実行のされ方を 破壊的 といいます）
  # つまり、テーブルに保存される全てのメールアドレスは小文字になります。メールアドレスが大文字でも小文字でも、同じ相手に届きます。
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end
