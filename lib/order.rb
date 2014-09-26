require_relative 'dish'

class Order

    attr_reader :items

	def initialize
		@items = {}
	end

	def add_item(dish, qty)
		raise "This is not a dish" unless dish.class == Dish
		@items[dish] = qty
	end

end