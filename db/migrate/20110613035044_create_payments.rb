class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :program_id
      t.boolean :payed
      t.boolean :discount
      t.boolean :exemption
      t.string :paymethod

      t.timestamps
    end
  end
end
