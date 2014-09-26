require 'menu'

describe Menu do 

	let(:menu) {Menu.new}
	let(:dish) {double :dish}

	it "should initialize with an empty array" do
        expect(menu.dishes.count).to eq(0)
    end

    it "should be able to add items" do
    	expect{menu.add_dish(dish)}.to change{menu.dishes.count}.by 1
    end
	
end