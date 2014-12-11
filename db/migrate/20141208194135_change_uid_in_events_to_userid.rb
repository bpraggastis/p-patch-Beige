class ChangeUidInEventsToUserid < ActiveRecord::Migration
  def change
    rename_column :events, :uid, :user_id
  end
end
