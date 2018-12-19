require 'rails_helper'

RSpec.describe MasterSale, type: :model do
  it 'Accepts nested attributes for Sale' do
    is_expected.to accept_nested_attributes_for(:sales).
      allow_destroy(true)
  end

  context 'Associations' do
    it { is_expected.to have_many(:sales) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  it 'Is valid' do
    master_sale = create(:master_sale)
    expect(master_sale).to be_valid
  end
end
