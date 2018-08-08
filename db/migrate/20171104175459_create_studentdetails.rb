class CreateStudentdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :studentdetails do |t|

      t.timestamps
    end
  end
end
