class CreateProfdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :profdetails do |t|

      t.timestamps
    end
  end
end
