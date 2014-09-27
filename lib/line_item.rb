class LineItem

    attr_reader :dish, :qty

	def initialize(dish, qty)
		@dish = dish
		@qty = qty
	end

	def line_total
		@dish.price.to_i * @qty.to_i
	end

end