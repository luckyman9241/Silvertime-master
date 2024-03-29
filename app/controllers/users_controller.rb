class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    if current_user.super_user?
      @users = User.paginate(page: params[:page])
    elsif current_user
      @users = User.where(account_id: current_account).paginate(page: params[:page])
    end
  end

  def show
  	@user = User.find(params[:id])
    @timecards = @user.timecards.paginate(page: params[:page] )
  end

  def new
  	@user = User.new
    @user.account_id = current_account.id
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Successfully saved new user!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url, notice: "Access denied" unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def current_account
      Account.find(current_user.account_id)
    end

end
