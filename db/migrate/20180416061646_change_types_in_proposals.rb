class ChangeTypesInProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:express_fees , :integer,default: 0
  end
end
