class ChangecolumnsInProposals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:course_fees , :integer,null: false,default: 0
    change_column :proposals,:travel , :integer,null: false,default: 0
    change_column :proposals,:lodging , :integer,null: false,default: 0
    change_column :proposals,:sundry , :integer,null: false,default: 0
    change_column :proposals,:trainer_fee , :integer,null: false,default: 0
    change_column :proposals,:hospitality , :integer,null: false,default: 0
    change_column :proposals,:others_fees , :integer,null: false,default: 0
    change_column :proposals,:course_fees_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:travel_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:lodging_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:sundry_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:trainer_fee_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:hospitality_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:others_fees_sanctioned , :integer,null: false,default: 0
    change_column :proposals,:title,:string,null: false, default: "TITLE"
  end
end
