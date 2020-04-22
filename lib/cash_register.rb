require 'pry'
class CashRegister 
    attr_accessor :total, :discount
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    
    end

    def add_item(title, price, quantity=1)
        @items << {
            :title => title,
            :price => price,
            :quantity => quantity
        }
        @total += (price * quantity) 
    end

    def apply_discount
        if @discount > 0
            @total *= ((100.0 - @discount)/100)
            return "After the discount, the total comes to $#{@total.to_i}."
        end
        "There is no discount to apply."
    end

    def items
        items_array = []
        @items.each do |item|
            item[:quantity].times do 
                items_array << item[:title]
            end
        end
        items_array
    end

    def void_last_transaction
        new_total = 0
        @items.pop
        @items.each do |item|
            new_total += item[:price] * item[:quantity]
        end
        @total = new_total
    end
end
