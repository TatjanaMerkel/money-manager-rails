class AppController < ApplicationController
  include AuthentificationHelper
  before_action :check_login, except: [:login, :auth, :register, :activate, :not_found]
  before_action :set_locale

  def auth
    if authenticate_user(params[:email], params[:password])
      session[:user_id] = @account.id
      redirect_to '/app/overview'
    else
      redirect_to login_path, flash: {error: t(:login_failed)}
    end
  end

  def logout
    @account = nil
    session[:user_id] = nil

    redirect_to login_path, flash: {login_message: t(:logout_successfull)}
  end

  def login
    if session[:user_id] # redirect when user is logged in
      if AuthentificationHelper.check_login(session[:user_id])
        redirect_to :overview
      end
    end
  end

  def overview
  end

  def edit_record
    @entry = Entry.new
    
    @categories = @account.categories

  end

  def settings
    @configuration = @account.configuration
  end

  def register
    email = params[:email]
    password = params[:password]

    if Account.find_by_email email  # Account already exists
      msg = t :account_creation_failed_exists
    else  # create account
      account = Account.new do |account|
        account.email = email
        account.password = password
        account.configuration = ::Configuration.new locale: Locale.find_by_name('de'), avatar: 'max.jpg'
      end

      if account.save
        ActivationMailer.with(account: account).activation_mail.deliver_now  # send register mail

        redirect_to :login, flash: {error: t(:account_registration_successfull)}
        return
      else
        msg = t :account_creation_failed_unknown
      end
    end

    redirect_to :login, flash: {error: msg}

  end

  def activate

    account = Account.find_by_salt params[:salt]

    if account.activate? params[:salt]

      msg = t :account_activation_successfull
    else
      msg = t :account_activation_failed
    end

    redirect_to :login, flash: {error: msg}
  end

  def update_settings
    configuration = @account.configuration

    configuration.locale_id = params[:configuration][:locale_id]

    if configuration.save
      redirect_to request.referrer
      I18n.reload!
    else
      redirect_to overview_path, flash: {error: t(:failure)}
    end

  end

  def statistics
  end

  def not_found
    render status: 404
  end

  def entries_overview
    @categories = @account.categories
  end

  private

  def check_login
    # if accounts cant be authentified, redirect
    unless (@account = AuthentificationHelper.check_login(session[:user_id]))
      redirect_to :login
      return
    end
  end


  def authenticate_user(email, password)
    @account = AuthentificationHelper.authenticate_user email, password
  end

  def settings_params
    params.require(:configuration).permit(:locale)
  end

  def set_locale
    # if accounts is available, set locale from accounts
    I18n.locale = @account.configuration.locale.name if @account
  end
end
