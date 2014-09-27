require_relative 'dish'
require_relative 'menu'

class Order

    attr_reader :items

	def initialize
		@items = {}
	end

	def add_item(menu, dish, qty)
		raise "This item is not on the menu" unless  menu.check_dish(dish)
		@items[dish] = qty
	end

end