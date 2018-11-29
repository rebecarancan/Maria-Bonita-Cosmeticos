module Accounting
  class ChartsController < ApplicationController

    def index
      @cansei = MasterSale.order(:created_at)
    end

  end
end

# Coletar todas as MasterSales
# Agrupar por ano
# Ordenar por ordem de criação
# Colocar num hash key: month value: income_total
