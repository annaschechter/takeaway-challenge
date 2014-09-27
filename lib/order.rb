require_relative 'dish'
require_relative 'menu'
require_relative 'line_item'

class Order

    attr_reader :items, :line_totals

	def initialize
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
	end

	def complete?
		@complete
	end

end