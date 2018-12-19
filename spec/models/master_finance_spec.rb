require 'rails_helper'

RSpec.describe MasterFinance, type: :model do
  it 'Accepts nested attributes for Finance' do
    is_expected.to accept_nested_attributes_for(:finances).
      allow_destroy(true)
  end

  context 'Associations' do
    it { is_expected.to have_many(:finances) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  it 'Is valid' do
    master_finance = create(:master_finance)
    expect(master_finance).to be_valid
  end
end
