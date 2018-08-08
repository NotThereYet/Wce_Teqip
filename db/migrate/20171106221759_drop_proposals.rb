class DropProposals < ActiveRecord::Migration[5.1]
  def change
  	drop_table :proposals
  end
end
