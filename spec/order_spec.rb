require 'order'

describe Order do 

	let(:order) {Order.new}
	let(:dish) {double :dish}
	let(:qty) {double :qty}

	it "should initialize with an empty hash of items" do
		expect(order.items.count).to eq(0)
	end

	it "should allow adding items to the items hash" do
	    expect{order.add_item(dish, qty)}.to change{order.items.count}.by 1
	end
	
end