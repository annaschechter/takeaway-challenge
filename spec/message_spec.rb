require 'message'

describe Message do 

	let(:message) {Message.new}

	it "should initialize as not sent" do
		expect(message).to_not be_sent
	end

	it "should be able to update to sent" do
		message.send_text
		expect(message).to be_sent
	end

end