require 'rails_helper'

RSpec.describe MasterSalesHelper, type: :helper do

  describe '#total_income(obj, type)' do
    it "Calculates the total value of 'Dinheiro'" do
      master_sale = create(:master_sale_with_sales)
      expect(total_income(master_sale.sales, 'Dinheiro')).to eq(master_sale.sales.select { |sale| sale.income_type.name == 'Dinheiro' }.sum(&:value))
    end
  end

  describe '#total_days(obj, type)' do
    it "Calculates the total of days for 'Dinheiro'" do
      master_sale = create(:master_sale_with_sales)
      expect(total_days(master_sale.sales, 'Dinheiro')).to eq(master_sale.sales.select { |sale| sale.income_type.name == 'Dinheiro' }.count)
    end
  end

  describe '#income_average(obj, kind)' do
    it "Calculates the average for 'Dinheiro'" do
      master_sale = create(:master_sale_with_sales)
      expect(income_average(master_sale.sales, 'Dinheiro')).to eq(master_sale.sales.from_type('Dinheiro').average(:value_cents))
    end
  end

end
