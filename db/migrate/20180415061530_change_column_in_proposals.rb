class ChangeColumnInProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:requested_amount , :integer,default: 0
  end
end
