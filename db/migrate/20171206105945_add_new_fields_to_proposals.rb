class AddNewFieldsToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :submit_bill, :string, default: "No"
    add_column :proposals, :debited_to_acc, :string, default: "No"
  end
end
