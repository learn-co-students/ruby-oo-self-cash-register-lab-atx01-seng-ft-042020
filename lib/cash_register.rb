class CashRegister
    attr_accessor :total, :discount, :price
    def initialize(discount = 0)
        #binding.pry
        @items = []
        @discount = discount
        @total = total
        @prices = []
        self.total = 0.0
        #binding.pry
    end
    def add_item(title, price, quantity = 1)
        !!quantity ? quantity.times {@items << title} : @items << title
        self.total += (price * quantity)
        !!quantity ? quantity.times {@prices << price} : @prices << price
        #binding.pry
    end
    def apply_discount
        if discount != 0
          self.total = (@total * (0.01 * (100 - discount))).round
          "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        item_to_remove = @items.last
        @prices.reverse.each {|e|
            reversed = @items.reverse
            if reversed.first == item_to_remove
                @total -= e
                @prices.pop
                @items.pop
            end
        }
        @total
    end
end