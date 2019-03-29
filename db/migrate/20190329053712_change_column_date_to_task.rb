class ChangeColumnDateToTask < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, :datetime, default: -> { 'NOW()' }, null: false
  end
end
