class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @accounts = Account.all
    respond_with(@accounts)
  end

  def show
    respond_with(@account)
  end

  def new
    @account = Account.new
    respond_with(@account)
  end

  def edit
  end

  def create
 account = Account.find_by(name: user_params[:name])
    if account and account.authenticate(account_params[:password])
       puts "Success! Yay!"# login.
    else
       puts "You buster,,,"#error.
    end
  end

  def update
    @account.update(account_params)
    respond_with(@account)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :display_name, :password, :password_confirmation, :email)
    end
end
