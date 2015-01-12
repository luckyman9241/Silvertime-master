class AddApprovedToTimecard < ActiveRecord::Migration
  def change
  	add_column :timecards, :approved, :boolean, default: false
  end
end
