require 'rails_helper'

RSpec.describe MasterOrder, type: :model do
  it 'Accepts nested attributes for Order' do
    is_expected.to accept_nested_attributes_for(:orders).
      allow_destroy(true)
  end

  context 'Associations' do
    it { is_expected.to have_many(:orders) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  it 'Is valid' do
    master_order = create(:master_order)
    expect(master_order).to be_valid
  end
end
