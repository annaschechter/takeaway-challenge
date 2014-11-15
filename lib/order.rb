require_relative 'line_item'
require_relative 'message'
require_relative 'customer'
require_relative 'dish'


class Order

    attr_reader :items, :line_totals, :customer

	def initialize(customer)
		@customer = customer
		@items = {}
		@line_totals = []
		@complete = false
	end

	def add_item(menu, dish, qty)
		raise "This item is not on the menu" unless  menu.check_dish(dish)
		@items[dish] = qty
	end

	def cancel_item(dish)
		raise "This item is not in your order" unless  @items.include?(dish)
        @items.delete(dish)
	end


	def add_line_totals
		@items.each{|dish, qty| @line_totals << LineItem.new(dish, qty).line_total}
	end

	def grand_total
		add_line_totals
		@line_totals.inject(&:+)
	end

	def complete_order!
		raise "This order cannot be completed because it is empty!" if @items.empty?
		@complete = true
		Message.new.send_text!
	end

	def complete?
		@complete
	end

	def deliver!
		@customer.can_start_again
	end

end