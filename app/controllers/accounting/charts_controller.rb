module Accounting
  class ChartsController < ApplicationController

    def index
      @sales_groups = MasterSales.each do |sale| {
        sale.income_total(1)
      }
    end
  end
end
