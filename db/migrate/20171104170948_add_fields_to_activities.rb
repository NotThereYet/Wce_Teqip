class AddFieldsToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :title, :string
    add_column :activities, :desc, :text
    add_column :activities, :event_date, :date
    add_column :activities, :attachment, :string
  end
end
