require "pry"

class CashRegister
    attr_reader :total, :discount, :price, :quantity

    def initialize discount = 0
        @total = 0
        @discount = discount
        @all_items = []
    end

    def total=value
        @total = value
    end

    def add_item title, price, quantity = 1
        @total += (price * quantity)
        @price = price
        @quantity = quantity
        item_titles = [] << title
        @all_items << item_titles * quantity
    end

    def apply_discount
        if @discount != 0
            @total = @total - @total * (@discount/100.0)
            "After the discount, the total comes to $#{total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @all_items.flatten!
    end

    def void_last_transaction
        if self == nil 
            @total = 0
        else 
            @total -= self.price * self.quantity
        end

    end

end
