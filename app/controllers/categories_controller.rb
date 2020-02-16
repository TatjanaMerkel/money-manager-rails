class CategoriesController < ApplicationController
  include AuthentificationHelper, AppHelper

  before_action :check_login
  before_action :set_locale
  before_action :get_category, only: [:show, :update, :svg]

  def index
  end

  def new

  end

  def show
  end

  def update
    @category.update(icon: params[:category][:icon])
    @category.update(name: params[:category][:title])
    @category.update(color: params[:category][:color])
  end

  def svg
    puts @category.svg_icon
    render xml: @category.svg_icon
  end

  private

  def get_category
    @category = Category.find params[:id]
  end

  private

  def entry_params

    p = params.require(:entry).permit(:title, :amount, :date, :category_id)
    p[:currency] = Currency.first    

    p

  end

  def check_login
    @account = AuthentificationHelper.check_login(session[:user_id])

    redirect_to :login unless @account
  end

  def set_locale
    # if accounts is available, set locale from accounts
    I18n.locale = @account.configuration.locale.name if @account
  end
end