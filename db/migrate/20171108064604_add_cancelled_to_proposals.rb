class AddCancelledToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :cancelled, :string
  end
end
