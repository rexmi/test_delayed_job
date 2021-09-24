class SendSmsJob < ApplicationJob

	def perform(body)
    send_text(body, '7789534883')
	end

	def send_text(text, to)
    account_sid = 'AC7c68156f35d865c9a38d2f4207381e81'
    auth_token = 'cc38cf9e33d4ac098326741548cd0fd8'
    
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+19375240113'

    client.messages.create(
      from: from,
      to: to,
      body: text
      )
  end
end