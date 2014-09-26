class Menu

	attr_reader :dishes

	def initialize
		@dishes = []
	end

	def add_dish(dish)
		raise "This is not a dish" unless dish.class == Dish
		@dishes << dish
	end

end