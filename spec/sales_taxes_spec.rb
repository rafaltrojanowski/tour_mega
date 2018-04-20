require_relative '../sales_taxes'

describe SalesTaxes do

  describe '#output' do
    context 'when input 1' do
      it 'returns string' do
        input_1 = <<-eos
          1, book, 12.49
          1, music cd, 14.99
          1, chocolate bar, 0.85
        eos

        expect(SalesTaxes.new(input_1).output).to eq "1, book, 12.49\n1, music cd, 16.49\n1, chocolate bar, 0.85\nSales Taxes: 1.50\nTotal: 29.83\n"
      end
    end

    context 'when input 2' do
      it 'returns string' do
        input_2 = <<-eos
          1, imported box of chocolates, 10.00
          1, imported bottle of perfume, 47.50
        eos

        expect(SalesTaxes.new(input_2).output).to eq "1, imported box of chocolates, 10.50\n1, imported bottle of perfume, 54.65\nSales Taxes: 7.65\nTotal: 65.15\n"
      end
    end

    context 'when input 3' do
      it 'returns string' do
        input_3 = <<-eos
          1, imported bottle of perfume, 27.99
          1, bottle of perfume, 18.99
          1, packet of headache pills, 9.75
          1, box of imported chocolates, 11.25
        eos

        expect(SalesTaxes.new(input_3).output).to eq "1, imported bottle of perfume, 32.19\n1, bottle of perfume, 20.89\n1, packet of headache pills, 9.75\n1, box of imported chocolates, 11.85\nSales Taxes: 6.70\nTotal: 74.68\n"
      end
    end
  end
end
