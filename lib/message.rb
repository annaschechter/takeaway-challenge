require 'rubygems'
require 'twilio-ruby'

class Message

	attr_reader :text

	def initialize
		@sent = false
	end

	def create_text
		@delivery_time = Time.now + 60 * 60
		@text = "Thank you! Your order was placed and will be delivered before #{@delivery_time.strftime('%H:%M')}."
    end

	def send_text
		create_text
		account_sid = "AC91a6dee08bbe2d14e7a6b175e6dfb6a8"
        auth_token = "0c10b5dfbc3fc1f98125a847db54d0d3"
        @client = Twilio::REST::Client.new account_sid, auth_token
        @client.account.messages.create({
		:from => '+441305300063', 
		:to => '+447746010888', 
		:body => "#{@text}"
		})

		@sent = true
	end

	def sent?
		@sent 
	end
end