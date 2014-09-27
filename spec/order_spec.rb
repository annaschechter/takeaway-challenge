require 'order'

describe Order do 

	let(:order) {Order.new}
    let(:dish) {double :dish}
	let(:menu1) {double :menu, :check_dish => true}
	let(:menu2) {double :menu, :check_dish => false}


	it "should initialize with an empty hash of items" do
		expect(order.items.count).to eq(0)
	end

	it "should allow adding items to the items hash" do
	    expect{order.add_item(menu1, dish, 3)}.to change{order.items.count}.by 1
	end

	it "should not allow adding items that are on the menu" do
		expect(lambda {order.add_item(menu2, :massage, 3)}).to raise_error "This item is not on the menu"
    end
	
end