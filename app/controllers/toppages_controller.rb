class ToppagesController < ApplicationController
  def index
    # 実は Controller のデフォルト機能として、アクションの最後に render :自身のアクション名 を呼び出しています。
    # つまり今回は render :index であり、ToppagesController なので app/views/toppages/index.html.erb が呼び出される
  end
end
