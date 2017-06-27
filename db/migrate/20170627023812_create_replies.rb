class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer  :issue_id
      t.text     :content, null: false
      t.string   :author, null: false
      t.timestamps
    end
  end
end
