require_relative 'customer'
require_relative 'order'

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

    def accept_order(order, message)
    	raise "This is not an order" unless order.class == Order
    	raise "This order has not been confirmed" unless order.complete?
    	@orders << order
    	message.send_text
    end

    def deliver_order(order)
    	raise "This order has not been accepted" unless @orders.include?(order)
    	order.deliver!
    	@orders.delete(order)
    end

end
