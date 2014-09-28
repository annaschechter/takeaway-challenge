require 'takeaway'

describe Takeaway do 

	let(:yo_sushi) {Takeaway.new}
	let(:dish) {Dish.new("Sushi", 3)}
	#let(:order) {Order.new(customer)}
	let(:customer) {Customer.new("Anna", 07746010777)}
	let(:message) {double :message}
    

	it "should initialize with a menu" do
		expect(yo_sushi.menu.class).to eq(Menu)
	end

	it "should initialize with an empty array of orders" do
		expect(yo_sushi.orders.count).to eq(0)
	end

	it "should be able to add dishes to the menu" do
		expect{yo_sushi.add_to_menu(dish)}.to change{yo_sushi.menu.dishes.count}.by 1
	end	

	it "should be able to remove dishes from the menu" do
		yo_sushi.add_to_menu(dish)
		expect{yo_sushi.remove_from_menu(dish)}.to change{yo_sushi.menu.dishes.count}.by -1
	end	

	it "should be able to accept orders" do
		yo_sushi.add_to_menu(dish)
		customer.select_dish(yo_sushi, dish, 2)
	    customer.place_order
	    allow(message).to receive(:send_text)
		expect{yo_sushi.accept_order(customer, message)}.to change{yo_sushi.orders.count}.by 1
	end

	it "should be able to deliver order" do
		yo_sushi.add_to_menu(dish)
		customer.select_dish(yo_sushi, dish, 2)
	    customer.place_order
	    allow(message).to receive(:send_text)
	    yo_sushi.accept_order(customer, message)
	    expect{yo_sushi.deliver_order(customer)}.to change{yo_sushi.orders.count}.by -1
	end    

end