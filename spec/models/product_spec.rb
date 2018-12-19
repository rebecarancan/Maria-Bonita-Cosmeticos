require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with code, name and cost' do
    product = create(:product)
    expect(product).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
