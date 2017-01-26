  class DfsService

  CONFIG= {
    :auth_key => 'piiXFZkC19eD1so8XEolCq8SMWI/GCSoXBSw/PwldGA=',
    :base_url => 'https://dev-api.dfstars.com'
  }

  def authenticate(name, username, email)

    dfs_id = register_account({
      name: name,
      username: username,
      email: email,
      birthdate: '1990-01-01'
      })
    
    login_url = login_account(dfs_id)
    puts login_url
    return login_url
  end

  def load_credits

  end

  def withdraw_credits

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
    user.credits = user.credits - amount
    user.save

  end

  def send_credits_to_dfstars(dfs_user_id, amount)
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


  end
