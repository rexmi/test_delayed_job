class Appointment < ApplicationRecord
	before_create :set_incomplete_at_create
	after_create :create_appt_job
	after_update :update_appt_time

	def set_incomplete_at_create
		self.status = 'incomplete'
	end

	def get_start_time
		self.start_time.strftime("%Y %b %d %H:%M")
	end

	def get_end_time
		self.end_time.strftime("%Y %b %d %H:%M")
	end

	def create_appt_job
		job_id = SendSmsJob.delay(run_at: self.end_time + 30).perform_now('hi john').id
		
		self.update_column(:job_id, job_id)

	end

	def update_appt_time
		job = Delayed::Job.find(self.job_id)
		job.update_column(:run_at, self.end_time + 60)
	end

	# handle_asynchronously :oof, :run_at => Proc.new { 1.minute.from_now }
end
