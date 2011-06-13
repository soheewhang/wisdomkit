class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :phone_number
      t.datetime :birthday
      t.string :group

      t.timestamps
    end
  end
end
