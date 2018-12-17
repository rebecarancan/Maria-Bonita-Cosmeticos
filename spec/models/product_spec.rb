require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with code, name and cost' do
    product = create(:product)
    expect(product).to be_valid
  end
end
