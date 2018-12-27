require 'rails_helper'

RSpec.describe MasterSalesHelper, type: :helper do

  describe '#total_income(obj, type)' do
    it "Calculates the total value of 'Dinheiro'" do
      master_sale = create(:master_sale_with_sales)
      expect(total_income(master_sale.sales, 'Dinheiro')).to eq(Money.new(50000, 'BRL'))
    end
  end

  describe '#total_days(obj, type)' do
    it "Calculates the total of days for 'Dinheiro'" do
      master_sale = create(:master_sale_with_sales)
      expect(total_days(master_sale.sales, 'Dinheiro')).to eq(10)
    end
  end

  describe '#income_average(obj, kind)' do
    it "Calculates the average for 'Dinheiro'" do
      master_sale = create(:master_sale_with_sales)
      expect(income_average(master_sale.sales, 'Dinheiro')).to eq(master_sale.sales.from_type('Dinheiro').average(:value_cents))
    end
  end

  describe '#sale_color(sale)' do
    it "Determines the css class" do
      master_sale = create(:master_sale_with_sales)
      expect(sale_color('Dinheiro')).to eq('class= income-color style=background:#d9b3ff')
    end
  end

end
