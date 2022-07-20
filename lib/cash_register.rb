require "pry"

class CashRegister
    attr_reader :total, :discount

    def initialize total = 0, discount = 20
        @total = total
        @discount = discount
    end

    def total=value
        @total = value
    end

    def add_item title, price, quantity = 1
        @total += (price * quantity)
    end

    def apply_discount
        @total = (@total - @discount) - (@total - @discount) * (@discount/100.0)
        "After the discount, the total comes to $#{total.to_i}."
    end

end
