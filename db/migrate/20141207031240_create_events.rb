class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :event_datetime
      t.string :location
      t.string :organizer
      t.string :contact_email
      t.text   :description
      t.integer :uid
      t.timestamps
    end
  end
end
