class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :phone_number
      t.datetime :birthday
      t.string :group
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
