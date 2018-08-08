class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
    	t.string :user_id
    	t.string :proposer_name
    	t.string :proposer_type, null: false
    	t.string :title,null: false
    	t.text :desc,null: false
    	t.date :start_date
    	t.date :end_date
    	t.string :approved,null: false, default: "No"
    	t.string :sanctioned,null: false, default: "No"
    	t.string :requested_amount
    	t.integer :sanctioned_amount,null: false, default: "0"
    	t.string :attachment
    	t.text :sanction_summary
    	t.integer :course_fees
    	t.integer :travel
    	t.integer :lodging
    	t.integer :sundry
    	t.integer :trainer_fee
    	t.integer :hospitality
    	t.string :others_reason
    	t.integer :others_fees
      t.timestamps
    end
  end
end



