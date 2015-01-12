class AddJobIdToPhase < ActiveRecord::Migration
  def change
    add_column :phases, :job_id, :integer
  end
end
