class EntriesController < ApplicationController
  include AuthentificationHelper

  before_action :check_login
  before_action :set_locale

  def create

    p = entry_params
    @entry = Entry.new(p)

    uploaded_io = params[:entry][:photo]
    if uploaded_io != nil
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @entry.photo = uploaded_io.original_filename
    end

    @entry.save

    redirect_to @entry, notice: t(:entry_successfully_created)
  end

  def show
    @entry = Entry.find_by_id(params[:id])
    @categories = @account.categories
  end

  def new
    @entry = Entry.new
    @categories = @account.categories

  end

  def index
    @entries = Entry.all
  end

  def update
    @entry = Entry.find_by_id(params[:id])

    uploaded_io = params[:entry][:photo]
    if uploaded_io != nil
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @entry.photo = uploaded_io.original_filename
    end

    if @entry.update(entry_params)
      redirect_to @entry, notice: t(:entry_successfully_updated)
    else
      render :show
    end
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