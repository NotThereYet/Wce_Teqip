class AddFieldsToStudentdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :studentdetails, :year, :string
    add_column :studentdetails, :branch, :string
    add_column :studentdetails, :prn, :string
    add_column :studentdetails, :gender, :string
    add_column :studentdetails, :contact_no, :string
    add_column :studentdetails, :address, :string
  end
end
