require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'Is valid with name' do
    supplier = create(:supplier)
    expect(supplier).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
