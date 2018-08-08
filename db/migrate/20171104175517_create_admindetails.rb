class CreateAdmindetails < ActiveRecord::Migration[5.1]
  def change
    create_table :admindetails do |t|

      t.timestamps
    end
  end
end
