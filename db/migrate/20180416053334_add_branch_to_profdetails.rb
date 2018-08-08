class AddBranchToProfdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :profdetails, :branch, :string
    add_column :profdetails, :gender, :string
    add_column :profdetails, :contact_no, :string
    add_column :profdetails, :address, :string
    add_column :profdetails, :user_id, :integer
  end
end
