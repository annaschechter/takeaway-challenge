require_relative 'order'

class Customer

	attr_reader :name, :phone

	def initialize(name, phone)
		@name = name
		@phone = phone
	end

	def select_dish(menu, dish, qty)
		@order = Order.new
		@order.add_item(menu, dish, qty)
	end

	def remove_dish(dish)
	    @order.cancel_item(dish)
	end

	def place_order
		raise "There are no orders to place" if @order == nil
	    @order.complete_order!
	end 

end