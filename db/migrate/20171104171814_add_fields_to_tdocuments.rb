class AddFieldsToTdocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :tdocuments, :title, :string
    add_column :tdocuments, :t_docs, :string
    add_column :tdocuments, :t_comp, :string
    add_column :tdocuments, :t_video, :string
  end
end
