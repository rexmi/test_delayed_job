class AddJobIdToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :job_id, :int 
  end
end
