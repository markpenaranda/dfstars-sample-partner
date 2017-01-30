class DfsController < ApplicationController
  def authenticate
    me = current_user
    amount = params[:amount]
    login_url = dfs_authenticate(me, amount)
    # dfs_authenticate(me.full_name, me.username, me.email, amount)
    
    redirect_to login_url
  end

  def add_credits
    amount = params[:amount]
    is_sent = dfs_load_credit(current_user, amount)
    
    if is_sent 
      render json: {amount: amount}, status: 200
    else
      render json: {amount: amount}, status: 400
    end
  end

  def remove_credits

  end

  private

  def dfs_authenticate(user, amount)
    return DfsService.new().authenticate(user, amount)
  end

  def dfs_load_credit(user, amount)
    return DfsService.new().load_credits(user, amount)
  end

end
