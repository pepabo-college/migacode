class ChangeColumnToIssuesNotificationFlg < ActiveRecord::Migration[5.1]

def up
    change_column :issues,:notification_flg, :boolean, null: false
end

def down
    change_column :issues,:notification_flg, :boolean
end


end

