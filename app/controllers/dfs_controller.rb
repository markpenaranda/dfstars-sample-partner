class DfsController < ApplicationController
  def authenticate
    me = current_user
    amount = params[:amount]
    login_url = dfs_authenticate(me.full_name, me.username, me.email, amount)
    # dfs_authenticate(me.full_name, me.username, me.email, amount)
    
    redirect_to login_url
  end

  def add_credits
    
  end

  def remove_credits

  end

  private

  def dfs_authenticate(name, username, email, amount)
    return DfsService.new().authenticate(name, username, email, amount)
  end
end
