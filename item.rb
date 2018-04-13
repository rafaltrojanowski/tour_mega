Item = Struct.new(:quantity, :product, :price, :net_revenue, :tax) do

  def calculate_tax
    basic_tax = 0
    import_tax = 0

    basic_tax = self.net_revenue * 0.1 unless product_without_tax?
    import_tax = self.net_revenue * 0.05 if product_imported?

    self.tax = round(basic_tax + import_tax)
  end

  def round(value)
    (value * 20).ceil / 20.0
  end

  def to_row
    "#{quantity}, #{product}, #{gross_price}\n"
  end

  def gross_price
    sprintf("%0.02f", net_revenue + tax)
  end

  def product_imported?
    product.include? 'imported'
  end

  def product_without_tax?
    book? || food? || medical?
  end

  def book?
    product.include? 'book'
  end

  def food?
    product.include? 'chocolate'
  end

  def medical?
    product.include? 'pill'
  end
end
