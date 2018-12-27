require 'rails_helper'

RSpec.describe ProductsHelper, type: :helper do
  describe '#calculate_price(cost, margin)' do
    it 'Calculates the final price of products' do
      expect(calculate_price(10, 50)).to eq(15)
    end
  end
end
