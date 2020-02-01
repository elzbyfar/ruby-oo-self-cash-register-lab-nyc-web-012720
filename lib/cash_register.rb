
require 'pry'
class CashRegister
    attr_accessor :total, :discount, :title, :price, :quantity, :add_item, :items, :last_transaction

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity=1)
        @total += price * quantity
        @last_transaction = price * quantity
        quantity.times do 
            @items << title
        end 
    end

    def apply_discount
        if @discount 
            @total -= (@total.to_f * (@discount.to_f * 0.01))
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end 
    end 

    def items
        @items
    end 

    def void_last_transaction
        @total -= @last_transaction
    end 
end 
