module Accounting
  class ChartsController < ApplicationController

    def index
      master_sales =  MasterSale.group_by_month_of_year('master_sales.created_at', format: '%b / %y').joins(sales: :income_type).where(sales: { income_types: { name: 'Dinheiro'}}).sum(:value_cents)

      master_sales.each do |key, value|
        master_sales[key] = value.to_f/100.00
      end

      @money = master_sales
    end

  end
end

# Coletar todas as MasterSales
# Agrupar por ano
# Ordenar por ordem de criação
# Colocar num hash key: month value: income_total
