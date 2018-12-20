require 'rails_helper'

RSpec.describe ProductsHelper, type: :helper do
  describe '#calculate_price(cost, margin)' do
    it 'Calculates de final price of products' do
      product = create(:product)
      expect(product.calculate_price(product.cost, product.margin)).to eq(product.cost + ( product.cost * product.margin * 0.01))
    end
  end
end
