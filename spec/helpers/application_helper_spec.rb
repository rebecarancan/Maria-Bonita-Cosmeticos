require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#value_total(obj)' do
    it 'Calculates the total value of sales' do
      master_sale = create(:master_sale_with_sales)
      expect(value_total(master_sale.sales)).to eq(Money.new(50000, 'BRL'))
    end
  end

  describe '#calc_balance(obj, balance)' do
    it 'Calculates the balance of master_finance' do
      master_finance = create(:master_finance_with_finances)
      expect(calc_balance(master_finance.finances, master_finance.initial_balance)).to eq(Money.new(265000, 'BRL'))
    end
  end

  describe '#income_calc(obj)' do
    it 'Calculates the total value of incomes' do
      master_finance = create(:master_finance_with_finances)
      expect(income_calc(master_finance.finances)).to eq(Money.new(250000, 'BRL'))
    end
  end

end
