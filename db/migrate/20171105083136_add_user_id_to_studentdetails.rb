class AddUserIdToStudentdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :studentdetails, :user_id, :integer
  end
end
