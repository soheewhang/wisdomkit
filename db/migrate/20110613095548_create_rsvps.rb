class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :program_id
      t.string :status

      t.timestamps
    end
  end
end
