class CashRegister
    require 'pry'
    attr_accessor :discount, :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @price = []
    end

    def total
        @total
    end

    def add_item(name, price, quantity = 1)
        quantity.times do |x|
            @items << name
        end
        @price << (price * quantity)
        @total += price * quantity
    end

    def apply_discount
        #binding.pry
        if @discount != 0
            @total = self.total - (self.total * (@discount/100.0)).to_i
            p "After the discount, the total comes to $#{@total}."
        else
            p "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        #binding.pry
        @total = @total - @price[-1]
        @items.pop()
    end

end