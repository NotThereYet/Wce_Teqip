class RemoveDobFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users,:dob
  end
end
