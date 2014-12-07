class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :time
      t.string :location
      t.string :organizer
      t.string :contact_email
      t.text   :description
      t.timestamps
    end
  end
end
