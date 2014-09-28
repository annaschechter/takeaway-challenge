require 'menu'

describe Menu do 

	let(:menu) {Menu.new}
	let(:dish) {double :dish, :class => Dish}

	it "should initialize with an empty array" do
        expect(menu.dishes.count).to eq(0)
    end

    it "should be able to add items to the menu" do
    	expect{menu.add_dish(dish)}.to change{menu.dishes.count}.by 1
    end

    it "should not add items that are not dishes" do
    	expect(lambda {menu.add_dish(:massage)}).to raise_error "This is not a dish"
    end	

    it "should be able to remove items from the menu" do
        menu.add_dish(dish)
        expect{menu.remove_dish(dish)}.to change{menu.dishes.count}.by -1
    end

    it "should raise an error when trying to remove an item not on the menu" do
        expect(lambda {menu.remove_dish(:massage)}).to raise_error "This dish is not on the menu"
    end 

    it "should know if the dish is on the menu" do
        menu.add_dish(dish)
        expect(menu.check_dish(dish)).to be true
    end
	
end