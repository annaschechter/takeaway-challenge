require_relative 'customer'
require_relative 'order'
require_relative 'menu'


class Takeaway
    
    attr_reader :menu, :orders

    def initialize 
        @menu = Menu.new
        @orders = []
    end

    def add_to_menu(dish)
    	@menu.add_dish(dish)
    end

    def remove_from_menu(dish)
    	@menu.remove_dish(dish)
    end

    def accept_order(customer, message)
    	raise "This is not an order" unless customer.order.class == Order
    	raise "This order has not been confirmed" unless customer.order.complete?
    	@orders << customer.order
    	message.send_text
    end

    def deliver_order(customer)
    	@order = customer.order
    	raise "This order has not been accepted" unless @orders.include?(customer.order)
    	customer.order.deliver!
    	@orders.delete(@order)
    end

end
