class AddFieldsInProposals < ActiveRecord::Migration[5.1]
  def change
  add_column :proposals, :publication_fee, :integer,null: false,default: 0
  add_column :proposals, :patenting_fee,:integer,null: false,default: 0
  add_column :proposals, :project_fee, :integer,null: false,default: 0
  add_column :proposals, :thesis_fee, :integer,null: false,default: 0
  add_column :proposals, :consumables_fee, :integer,null: false,default: 0
  add_column :proposals, :qualification_fee, :integer,null: false,default: 0
  add_column :proposals, :consumables_fee_sanctioned, :integer,null: false,default: 0
  add_column :proposals, :qualification_fee_sanctioned, :integer,null: false,default: 0
  add_column :proposals, :publication_fee_sanctioned, :integer,null: false,default: 0
  add_column :proposals, :patenting_fee_sanctioned, :integer,null: false,default: 0
  add_column :proposals, :project_fee_sanctioned, :integer,null: false,default: 0
  add_column :proposals, :thesis_fee_sanctioned, :integer,null: false,default: 0
end
end
