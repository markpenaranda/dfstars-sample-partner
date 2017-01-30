  class DfsService

  CONFIG= {
    :auth_key => 'piiXFZkC19eD1so8XEolCq8SMWI/GCSoXBSw/PwldGA=',
    :base_url => 'https://dev-api.dfstars.com',
    :operator_root_user_id => '319711'
  }

  def authenticate(user, amount)

    dfs_id = register_account({
      name: user.full_name,
      username: user.username,
      email: user.email,
      birthdate: '1990-01-01'
      })
    
    user.dfs_id = dfs_id
    user.save

    if amount.to_i > 0 
      deduct_casino_credits(user, amount)
      send_credits_to_dfstars(dfs_id, amount.to_i)
    end

    login_url = login_account(dfs_id)
    return login_url
  end

  def load_credits(user, amount)
    if amount.to_i > 0
      deduct_casino_credits(user, amount)
      sent = send_credits_to_dfstars(user.dfs_id, amount.to_i)
    end
    return sent
  end

  def withdraw_credits(user, amount)

  end

  private

  def register_account(account_details)
    begin
      url = CONFIG[:base_url] + '/users'
      headers = {"Authorization": "key " + CONFIG[:auth_key], content_type: :json, accept: :json}
      resp = RestClient.post(url, account_details.to_json, headers)
      dfs_user = JSON.parse(resp);
      return dfs_user['id']
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def login_account(user_id)
    begin
      url = CONFIG[:base_url] + '/sessions'
      headers = {"Authorization": "key " + CONFIG[:auth_key], content_type: :json, accept: :json}
      resp = RestClient.post(url, {userId: user_id, logoutUrl: "http://localhost:3000"}.to_json, headers)
      login = JSON.parse(resp)
      return login['loginUrl']
     rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def deduct_casino_credits(user, amount)
    user.credits = user.credits.to_i - amount.to_i
    user.save

  end

  def send_credits_to_dfstars(dfs_user_id, amount)
    begin
      transaction  = {
        amount: -amount,
        action: "SEND",
        toUserId: dfs_user_id
      }

      url = CONFIG[:base_url] + "/users/" + CONFIG[:operator_root_user_id] + "/transactions"
      headers = {"Authorization": "key " + CONFIG[:auth_key], content_type: :json, accept: :json}
      RestClient.post(url, transaction.to_json, headers)
      return true
     rescue RestClient::ExceptionWithResponse => e
      e.response
      return false
    end

  end


  end
