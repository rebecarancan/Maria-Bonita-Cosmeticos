require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#value_total(obj)' do
    it 'Calculates the total value of sales' do
      master_sale = create(:master_sale_with_sales)
      expect(value_total(master_sale.sales)).to eq(master_sale.sales.all.sum(&:value))
    end

    it 'Calculates the total value of notes' do
      master_note = create(:master_note_with_notes)
      expect(value_total(master_note.notes)).to eq(master_note.notes.all.sum(&:value))
    end

    it 'Calculates the total value of orders' do
      master_order = create(:master_order_with_orders)
      expect(value_total(master_order.orders)).to eq(master_order.orders.all.sum(&:value))
    end
  end

  describe '#calc_balance(obj, balance)' do
    it 'Calculates the balance of master_finance' do
      master_finance = create(:master_finance_with_finances)
      expect().to eq()
    end
  end

end
