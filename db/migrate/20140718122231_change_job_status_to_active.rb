class ChangeJobStatusToActive < ActiveRecord::Migration
  def change
  	remove_column :jobs, :status
  	add_column :jobs, :active, :boolean
  end
end
