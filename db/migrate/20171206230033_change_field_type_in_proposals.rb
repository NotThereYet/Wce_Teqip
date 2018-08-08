class ChangeFieldTypeInProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:course_fees_sanctioned , :integer
    change_column :proposals,:travel_sanctioned , :integer
    change_column :proposals,:lodging_sanctioned , :integer
    change_column :proposals,:sundry_sanctioned , :integer
    change_column :proposals,:trainer_fee_sanctioned , :integer
    change_column :proposals,:hospitality_sanctioned , :integer
    change_column :proposals,:others_fees_sanctioned , :integer
  end
end
