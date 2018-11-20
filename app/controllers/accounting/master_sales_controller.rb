module Accounting
  class MasterSalesController < ApplicationController
    before_action :set_master_sale, only: [:show, :edit, :update, :destroy]
    before_action :set_options_for_select, only: [:new, :create, :update, :edit]

    # GET /master_sales
    # GET /master_sales.json
    def index
      @master_sales = MasterSale.all.order('master_sales.created_at DESC')
      @master_sales = Kaminari.paginate_array(@master_sales).page(params[:page]).per(12)
    end

    # GET /master_sales/1
    # GET /master_sales/1.json
    def show
    end

    # GET /master_sales/new
    def new
      @master_sale = MasterSale.new
    end

    # GET /master_sales/1/edit
    def edit
    end

    # POST /master_sales
    # POST /master_sales.json
    def create
      @master_sale = MasterSale.new(master_sale_params)

      respond_to do |format|
        if @master_sale.save
          format.html { redirect_to accounting_master_sale_path(@master_sale), notice: 'Master sale was successfully created.' }
          format.json { render :show, status: :created, location: @master_sale }
        else
          format.html { render :new }
          format.json { render json: @master_sale.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /master_sales/1
    # PATCH/PUT /master_sales/1.json
    def update
      respond_to do |format|
        if @master_sale.update(master_sale_params)
          format.html { redirect_to action: :show, notice: 'Master sale was successfully updated.' }
          format.json { render :show, status: :ok, location: @master_sale }
        else
          format.html { render :edit }
          format.json { render json: @master_sale.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /master_sales/1
    # DELETE /master_sales/1.json
    def destroy
      @master_sale.destroy
      respond_to do |format|
        format.html { redirect_to action: :index, notice: 'Master sale was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_options_for_select
        @income_type_options_for_select = IncomeType.all
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_master_sale
        @master_sale = MasterSale.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def master_sale_params
        params.require(:master_sale).permit(:year, :month,
                                            sales_attributes: [
                                            :day, :value, :income_type_id, :_destroy])
      end
  end
end
