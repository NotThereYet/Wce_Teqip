class AddFieldsToNotices < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :title, :string
    add_column :notices, :desc, :text
  end
end
