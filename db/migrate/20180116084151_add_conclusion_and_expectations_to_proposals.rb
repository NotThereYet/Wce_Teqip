class AddConclusionAndExpectationsToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :conclusion, :text
    add_column :proposals, :expectations, :text
  end
end
