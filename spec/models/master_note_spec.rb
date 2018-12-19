require 'rails_helper'

RSpec.describe MasterNote, type: :model do
  it 'Accepts nested attributes for Note' do
    is_expected.to accept_nested_attributes_for(:notes).
      allow_destroy(true)
  end

  context 'Associations' do
    it { is_expected.to have_many(:notes) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  it 'Is valid' do
    master_note = create(:master_note)
    expect(master_note).to be_valid
  end

end
