class ChangeColumnInPropoals < ActiveRecord::Migration[5.1]
  def change
  	change_column :proposals,:user_id,:integer
  end
end
