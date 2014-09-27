require 'menu'

describe Menu do 

	let(:menu) {Menu.new}
	let(:dish) {double :dish, :class => Dish}

	it "should initialize with an empty array" do
        expect(menu.dishes.count).to eq(0)
    end

    it "should be able to add items" do
    	expect{menu.add_dish(dish)}.to change{menu.dishes.count}.by 1
    end

    it "should not add items that are not dishes" do
    	expect(lambda {menu.add_dish(:massage)}).to raise_error "This is not a dish"
    end	

    it "should know if the diesh is on the menu" do
        menu.add_dish(dish)
        expect(menu.check_dish(dish)).to be true
    end
	
end