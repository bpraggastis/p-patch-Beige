class CreateArticle < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
