require 'customer'

describe Customer do 

 let(:customer) {Customer.new("Anna Jerofejeva", 07746010777)}
 #let(:order) {Order.new}
 let(:takeaway) {Takeaway.new}
 let(:dish) {Dish.new("Burger", 4)}

	it "should initialize with name" do
      expect(customer.name.class).to eq(String)
    end

    it "should initialize with telephone number" do
        expect(customer.phone.class).to eq(Fixnum)
    end

    it "should be able to add dishes to the order" do
        takeaway.menu.add_dish(dish)
        expect{customer.select_dish(takeaway, dish, 2)}.to change{customer.order.items.count}.by 1
    end
    
    it "should be able to remove items from the order" do
        takeaway.menu.add_dish(dish)
        customer.select_dish(takeaway, dish, 2)
        expect{customer.remove_dish(dish)}.to change{customer.order.items.count}.by -1
    end

    it "should only be able to place orders that are not empty" do
    	  expect(lambda {customer.place_order}).to raise_error "There are no orders to place"
    end

	
end