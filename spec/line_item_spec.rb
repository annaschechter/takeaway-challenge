require 'line_item'

describe LineItem do 
	 let(:line_item) {LineItem.new(dish, 4)}
	 let(:dish) {double :dish, :class => Dish, :price => 5.00}

    it "should initialize with dish" do
		expect(line_item.dish.class).to eq(Dish)    
	end

	it "should initialize with quantity" do
		expect(line_item.qty.class).to eq(Fixnum)    
	end

	it "should calculate item total" do
		expect(line_item.line_total).to eq(4 * 5.00)
	end

end