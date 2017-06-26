class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string "title" ,null: false
      t.string "mail_address"
      t.text "content" ,null: false
      t.boolean "notification_flg" ,default: false
      t.string "author" ,null: false
      t.timestamps
    end
  end
end
