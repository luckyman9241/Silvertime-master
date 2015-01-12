module AccountsHelper

def current_account=(account)
  @current_account = account
end

def current_account
  @current_account = Account.find(current_user.account)
end

def current_account?(account)
  account == current_account
end

end
