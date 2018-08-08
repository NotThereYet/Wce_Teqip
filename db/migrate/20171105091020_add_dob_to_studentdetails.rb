class AddDobToStudentdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :studentdetails, :dob, :date
  end
end
