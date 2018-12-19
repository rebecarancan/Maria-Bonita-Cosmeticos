require 'rails_helper'

RSpec.describe MasterBank, type: :model do
  it 'Accepts nested attributes for Bank' do
    is_expected.to accept_nested_attributes_for(:banks).
      allow_destroy(true)
  end

  context 'Associations' do
    it { is_expected.to have_many(:banks) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  it 'Is valid' do
    master_bank = create(:master_bank)
    expect(master_bank).to be_valid
  end
end
