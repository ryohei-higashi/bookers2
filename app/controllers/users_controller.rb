class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :destroy] #本人以外は[]にはURLを打っても表示されない

  def index
    @users = User.all
    @book_new = Book.new#newbookの部分テンプレート
    @user = User.find(current_user.id)#user infoの部分テンプレート
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books#@userに紐づくbooksモデルのbook
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(uesr_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

   def uesr_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end

   def correct_user
  	 user = User.find(params[:id])
  	 if user != current_user
  		 redirect_to user_path(current_user)
  	 end

   end

end
