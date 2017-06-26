class ChangeColumnToIssues < ActiveRecord::Migration[5.1]
  def up
    change_column :issues,:author, :string, null: false
  end
  def down
    change_column :issues,  :author, :string, null: true
  end
end

