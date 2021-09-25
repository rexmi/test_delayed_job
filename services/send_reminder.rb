class SendReminder
	def initialize(end_time)
		@end_time = end_time
	end

	def create_delay_job
		job_id = SendSmsJob.delay(run_at: (@end_time + 25)).perform_now('it is good day to die').id
		# puts "88" * 8
		# puts @end_time
		# puts "88" * 8
		return job_id
	end
end