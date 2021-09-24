class SendSmsJob < ApplicationJob

	def perform(body)
    send_text(body, '7789534883')
	end

	def send_text(text, to)
    account_sid = 'AC5e85d5c0d198f5b5c2888da1d286df72'
    auth_token = '87b35d02b405db5ba66590a1d86bafd9'

    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+17787847858'

    client.messages.create(
      from: from,
      to: to,
      body: text
      )
  end
end