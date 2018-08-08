class AddFieldsToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :branch, :string
    add_column :proposals, :year, :string
  end
end
