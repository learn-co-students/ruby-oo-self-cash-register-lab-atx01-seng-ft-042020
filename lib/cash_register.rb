# code here!
class CashRegister 
    attr_accessor :total, :discount, :cart

    def initialize(discount=nil)
        @total = 0
        @cart = []
        @discount = discount
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        self.cart.append({:title => title, :price => price, :count => quantity})
    end

    def apply_discount
        if discount != nil 
            self.total -= (self.total * (self.discount / 100.0))
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items 
        res = []
        self.cart.each { |e| 
            for i in 0...e[:count] do
                res.append(e[:title])
            end
        }
        res
    end

    def void_last_transaction
        self.total -= self.cart[cart.count - 1][:price]
        self.cart.pop()
        self.total = 0.0 if self.cart == []
        return self.total
    end
end
