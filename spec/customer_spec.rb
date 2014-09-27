require 'customer'

describe Customer do 

 let(:customer) {Customer.new("Anna Jerofejeva", 07746010777)}

	it "should initialize with name" do
       expect(customer.name.class).to eq(String)
    end

    it "should initialize with telephone number" do
       expect(customer.phone.class).to eq(Fixnum)
    end
	
end