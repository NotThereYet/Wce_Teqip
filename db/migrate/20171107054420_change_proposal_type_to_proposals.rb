class ChangeProposalTypeToProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:proposal_type,:string,null: false,default: ""
  end
end
