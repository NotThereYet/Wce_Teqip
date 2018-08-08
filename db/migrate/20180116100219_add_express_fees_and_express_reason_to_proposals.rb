class AddExpressFeesAndExpressReasonToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :express_fees, :integer
    add_column :proposals, :express_reason, :text
  end
end
