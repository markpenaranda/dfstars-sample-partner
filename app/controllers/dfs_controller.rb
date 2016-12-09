class DfsController < ApplicationController
  def authenticate
    @user = dfs_authenticate
    render :json => @user
  end

  private

  def dfs_authenticate
    return DfsService.new().authenticate
  end
end
