require 'message'

describe Message do 

	let(:message) {Message.new}

	it "should initialize as not sent" do
		expect(message).to_not be_sent
	end

end