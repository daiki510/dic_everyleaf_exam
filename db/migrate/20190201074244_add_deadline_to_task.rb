class AddDeadlineToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :date, default: Time.now, null: false
  end
end
