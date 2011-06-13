class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.integer :price
      t.integer :period
      t.integer :term

      t.timestamps
    end
  end
end
