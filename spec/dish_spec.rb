require 'dish'

describe Dish do 

let(:kebab) {Dish.new("Shish Kebab", 6.49)}

	it "should initialize with name" do
		expect(kebab.name).to eq("Shish Kebab")
	end

	it "should initialize with price" do
		expect(kebab.price).to eq(6.49)
	end

end