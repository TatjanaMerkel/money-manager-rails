class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.float :amount
      t.date :date
      t.string :photo   # file name (including extension) of image in assets/images/photos

      t.belongs_to :category, index: true
      t.belongs_to :currency, index: true

      t.timestamps
    end
  end
end
