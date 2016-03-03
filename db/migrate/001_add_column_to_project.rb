class AddColumnToProject < ActiveRecord::Migration

  def change
    add_column :projects, :percentage_time, :integer
    add_column :projects, :number_days, :integer
    add_column :projects, :send_notification, :boolean, default: true

  end
end
