module AuthentificationHelper


  def self.check_login(id)
    # check if user id in session is existing
    # NO AUTHENTIFICATION, just a check if user has already logged in

    if id

      account = Account.find_by_id(id)
      if account.activated
        account
      else
        false
      end
    else
      false
    end
  end

  def self.authenticate_user(email, password)
    account = Account.find_by_email(email)

    if account&.activated && account.authenticate(password)
      account
    else
      false
    end
  end

end