require_relative 'order'

class Customer

	attr_reader :name, :phone, :order

	def initialize(name, phone)
		@name = name
		@phone = phone
		@order = Order.new(self)
	end

	def select_dish(takeaway, dish, qty)
		@order.add_item(takeaway.menu, dish, qty)
	end

	def remove_dish(dish)
	    @order.cancel_item(dish)
	end

	def place_order
		raise "There are no orders to place" if @order.items.empty?
	    @order.complete_order!
	end
    
    def can_start_again
    	@order = Order.new(self)
    end
end