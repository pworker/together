class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.references :event, index: true
      t.string :name
      t.string :email
      t.string :phone
      t.text :comment

      t.timestamps
    end
  end
end
