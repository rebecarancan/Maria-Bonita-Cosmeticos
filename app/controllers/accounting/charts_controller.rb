module Accounting
  class ChartsController < ApplicationController

    def index


      master_sales_money = MasterSale.group_by_year(:date, format: '%Y').group_by_month_of_year(:date, format: '%B').joins(sales: :income_type).where(sales: { income_types: { name: 'Dinheiro'}}).sum(:value_cents)

      master_sales_money.each do |key, value|
        master_sales_money[key] = Money.new(value, 'BRL').to_f
      end


      @money = master_sales_money

      master_sales_debit = MasterSale.group_by_year(:date).group_by_month_of_year(:date).joins(sales: :income_type).where(sales: { income_types: { name: 'Débito'}}).sum(:value_cents)

      master_sales_debit.each do |key, value|
        master_sales_debit[key] = value.to_f/100.00
      end

      @debit = master_sales_debit

      master_sales_credit = MasterSale.group_by_year(:date).group_by_month_of_year(:date).joins(sales: :income_type).where(sales: { income_types: { name: 'Crédito'}}).sum(:value_cents)

      master_sales_credit.each do |key, value|
        master_sales_credit[key] = value.to_f/100.00
      end

      @credit = master_sales_credit
    end

  end
end

# Coletar todas as MasterSales
# Agrupar por ano
# Ordenar por ordem de criação
# Colocar num hash key: month value: income_total
