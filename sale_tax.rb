require_relative 'item'

class SaleTax

  attr_reader :output

  def initialize(input)
    @input = input
    @items = []
    @output = nil

    calculate_tax
    print output
  end

  def calculate_tax
    @input.each_line do |row|
      data = row.split(',').map(&:strip)
      net_revenue = data[2].to_f * data[0].to_i # price * quantity
      item = Item.new(data[0].to_i, data[1], data[2].to_f, net_revenue, 0)
      item.calculate_tax
      @items << item
    end
  end

  def output
    output = ""

    order_netto = 0
    order_tax = 0
    @items.each do |item|
      order_netto += item.net_revenue
      order_tax += item.tax
      output << item.to_row
    end

    order_total_price = order_netto + order_tax

    output << "Sales Taxes: #{sprintf("%0.02f", order_tax)}\n"
    output << "Total: #{sprintf( "%0.02f", order_total_price)}\n"
  end
end
