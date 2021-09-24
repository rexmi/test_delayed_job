class SendSmsJob < ApplicationJob

	def perform(body)
    send_text(body, '7789534883')
	end

	def send_text(text, to)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+17787847858'

    client.messages.create(
      from: from,
      to: to,
      body: text
      )
  end
end