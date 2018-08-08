class ChangeAttachmentInProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:attachment , :string,default: ""
  end
end
