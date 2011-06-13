class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :rsvp_id
      t.boolean :discount
      t.boolean :exemption
      t.string :paymethod

      t.timestamps
    end
  end
end
