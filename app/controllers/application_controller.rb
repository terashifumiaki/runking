class ApplicationController < ActionController::Base
  
  # Helper に定義していた logged_in? を使用しているが
  # Controller から Helper のメソッドを使うことはデフォルトでは不可
  # そのため、ApplicationController に include SessionsHelper を追加
  include SessionsHelper
  
  
  # すべてのページで事前ログイン認証を確認するため
  private
  
  def require_user_logged_in
    # unlessはfalseの時に処理を実行する
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
