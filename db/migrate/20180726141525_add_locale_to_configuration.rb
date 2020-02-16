class AddLocaleToConfiguration < ActiveRecord::Migration[5.2]
  def change
    add_reference :configurations, :locale, index: true
  end
end
