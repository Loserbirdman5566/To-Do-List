class RemoveDueDateFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :due_date
  end
end
