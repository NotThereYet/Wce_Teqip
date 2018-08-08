class ChangeCancelledInProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:cancelled,:string,null: false,default: "No"
  end
end
