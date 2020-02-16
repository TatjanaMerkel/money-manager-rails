class CreateConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :configurations do |t|
      t.string :avatar  # file name (including extension) of image in assets/images/avatars

      t.belongs_to :account, index: true

      t.timestamps
    end
  end
end
