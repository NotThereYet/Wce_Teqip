class AddSanctionFieldsToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals,:course_fees_sanctioned , :string
    add_column :proposals,:travel_sanctioned , :string
    add_column :proposals,:lodging_sanctioned , :string
    add_column :proposals,:sundry_sanctioned , :string
    add_column :proposals,:trainer_fee_sanctioned , :string
    add_column :proposals,:hospitality_sanctioned , :string
    add_column :proposals,:others_fees_sanctioned , :string
  end
end
