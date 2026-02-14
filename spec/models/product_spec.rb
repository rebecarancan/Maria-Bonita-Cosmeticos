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

  context 'Search' do
    before do
      Product.create!(code: 100, name: 'Shampoo de Coco', cost_cents: 1500)
      Product.create!(code: 200, name: 'Condicionador de Coco', cost_cents: 2000)
      Product.create!(code: 300, name: 'Sabonete Líquido', cost_cents: 1000)
      Product.rebuild_search_index
    end

    describe '.full_search' do
      it 'returns products matching by code' do
        results = Product.full_search('100')
        expect(results.count).to eq(1)
        expect(results.first.code).to eq(100)
      end

      it 'returns products matching by name' do
        results = Product.full_search('Coco')
        expect(results.count).to eq(2)
        expect(results.pluck(:name)).to include('Shampoo de Coco', 'Condicionador de Coco')
      end

      it 'returns empty for blank query' do
        results = Product.full_search('')
        expect(results.count).to eq(0)
      end

      it 'supports OR queries' do
        results = Product.full_search('Sabonete OR Shampoo')
        expect(results.count).to eq(2)
      end

      it 'supports NOT queries' do
        results = Product.full_search('Coco NOT Sabonete')
        expect(results.count).to eq(2)
      end
    end

    describe '.full_search_prefix' do
      it 'returns products with prefix match' do
        results = Product.full_search_prefix('Cond')
        expect(results.count).to eq(1)
        expect(results.first.name).to eq('Condicionador de Coco')
      end

      it 'supports code prefix search' do
        results = Product.full_search_prefix('1')
        expect(results.count).to eq(1)
        expect(results.first.code).to eq(100)
      end

      it 'returns empty for blank query' do
        results = Product.full_search_prefix('')
        expect(results.count).to eq(0)
      end
    end

    describe '.rebuild_search_index' do
      it 'rebuilds index for specific products' do
        product = Product.last
        Product.delete_search_index(product.id)

        Product.rebuild_search_index(product.id)

        results = Product.full_search_prefix(product.name[0..2])
        expect(results).to include(product)
      end
    end

    describe 'index maintenance' do
      it 'updates search index on save' do
        product = Product.first
        product.update!(name: 'Shampoo Novo')

        results = Product.full_search('Novo')
        expect(results).to include(product)
      end

      it 'removes from search index on destroy' do
        product = Product.first
        product_id = product.id
        product.destroy!

        results = Product.full_search_prefix('Shampoo')
        expect(results.pluck(:id)).not_to include(product_id)
      end
    end
  end
end
