require 'customer'

describe Customer do 

 let(:customer) {Customer.new("Anna Jerofejeva", 07746010777)}
 let(:order) {double :order}

	it "should initialize with name" do
       expect(customer.name.class).to eq(String)
    end

    it "should initialize with telephone number" do
       expect(customer.phone.class).to eq(Fixnum)
    end

    it "should only be able to place orders that are not empty" do
    	expect(lambda {customer.place_order}).to raise_error "There are no orders to place"
    end

	
end