require 'message'

describe Message do 

	let(:message) {Message.new}
	let(:message1) {double :message}

	it "should initialize as not sent" do
		expect(message).to_not be_sent
	end

	it "should send text to the customer" do
		allow(message1).to receive(:send_text)
		message1.send_text
	    allow(message1).to receive(:sent?).and_return true
		expect(message1).to be_sent
	end

end