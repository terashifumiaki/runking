class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザ登録完了！'
      # 成功でユーザーページへ
      # redirect_to @user は、 処理を users#show のアクションへと強制的に移動させるもの
      # create アクション実行後に更に show アクションが実行され、show.html.erb が呼ばれる。
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録失敗！'
      # 失敗でnew.html.erbへ（元の登録ページ）
      render :new
    end
    # create に対応する View は用意する必要ない
  end


  
  private

# Strong Paramter
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
