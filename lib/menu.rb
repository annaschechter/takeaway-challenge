class Menu

	attr_reader :dishes

	def initialize
		@dishes = []
	end

	def add_dish(dish)
		raise "This is not a dish" unless dish.class == Dish
		@dishes << dish
	end

	def remove_dish(dish)
		raise "This dish is not on the menu" unless check_dish(dish)
        @dishes.delete(dish)
    end

	def check_dish(dish)
		@dishes.include?(dish)
	end

end