class AccountsController < ApplicationController
  before_action :super_admin_user

  def index
    @active_accounts = Account.all
  end

  def show
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = "Successfully created new account!"
      redirect_to @account
    else
      render 'new'
    end
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def account_params
      params.require(:account).permit(:name)
    end

    def super_admin_user
      redirect_to(root_url) unless current_user.super_user?
    end
end
