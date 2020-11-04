class RenameColumnEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :user_id, :event_admin_id
  end
end
