class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color           # CSS color name (e.g. "red", "#ff00ff")
      t.string :icon            # file name (including extension) of image in assets/images/icons
      t.integer :incomeExpense  # 0 = income, 1 = expense

      t.belongs_to :configuration, index: true

      t.timestamps
    end
  end
end
