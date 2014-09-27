require 'dish'

describe Dish do 

let(:dish) {Dish.new("Shish Kebab", 6.49)}

	it "should initialize with name" do
		expect(dish.name).to eq("Shish Kebab")
	end

	it "should initialize with price" do
		expect(dish.price).to eq(6.49)
	end

end