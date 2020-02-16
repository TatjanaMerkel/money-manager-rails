class RemovePasswordFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :password
  end
end
