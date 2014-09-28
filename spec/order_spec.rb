require 'order'

describe Order do 

	let(:order) {Order.new(customer)}
    let(:dish) {Dish.new("Sushi", 4)}
	let(:menu) {Menu.new}
	let(:customer) {Customer.new("Name", 07746010777)}


	it "should initialize with an empty hash of items" do
		expect(order.items.count).to eq(0)
	end

	it "should initialize with an empty array of line totals" do
		expect(order.line_totals.count).to eq(0)
	end

	it "should initialize with a customer" do
		expect(order.customer.class).to eq(Customer)
	end

	it "should allow adding items to the items hash" do
		menu.add_dish(dish)
	    expect{order.add_item(menu, dish, 3)}.to change{order.items.count}.by 1
	end

	it "should allow cancelling items from the items hash" do
		menu.add_dish(dish)
		order.add_item(menu, dish, 3)
	    expect{order.cancel_item(dish)}.to change{order.items.count}.by -1
	end

	it "should not allow adding items that are not on the menu" do
		expect(lambda {order.add_item(menu, :massage, 3)}).to raise_error "This item is not on the menu"
    end

    it "should not allow cancelling items that are not on the order" do
		expect(lambda {order.cancel_item(:massage)}).to raise_error "This item is not in your order"
    end

    it "should add line totals for each item ordered" do
    	expect(order.line_totals.count).to eq(order.items.count)
    end

    it "should calculate order grand total" do
    	menu.add_dish(dish)
    	order.add_item(menu, dish, 2)
    	expect(order.grand_total).to eq(8)
    end 

    it "should allow to complete order" do
    	menu.add_dish(dish)
    	order.add_item(menu, dish, 2)
    	order.complete_order!
    	expect(order).to be_complete
    end

    it "should not allow to complete empty order" do
    	expect(lambda{order.complete_order!}).to raise_error "This order cannot be completed because it is empty!"
    end	
    	
	
end