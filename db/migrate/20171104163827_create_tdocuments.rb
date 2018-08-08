class CreateTdocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :tdocuments do |t|

      t.timestamps
    end
  end
end
