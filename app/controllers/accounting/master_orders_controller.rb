module Accounting
  class MasterOrdersController < ApplicationController
    before_action :set_master_order, only: [:show, :edit, :update, :destroy]

    # GET /master_orders
    # GET /master_orders.json
    def index
      @master_orders = MasterOrder.all
    end

    # GET /master_orders/1
    # GET /master_orders/1.json
    def show
    end

    # GET /master_orders/new
    def new
      @master_order = MasterOrder.new
    end

    # GET /master_orders/1/edit
    def edit
    end

    # POST /master_orders
    # POST /master_orders.json
    def create
      @master_order = MasterOrder.new(master_order_params)

      respond_to do |format|
        if @master_order.save
          format.html { redirect_to accounting_master_order_path(@master_order), notice: 'Master order was successfully created.' }
          format.json { render :show, status: :created, location: @master_order }
        else
          format.html { render :new }
          format.json { render json: @master_order.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /master_orders/1
    # PATCH/PUT /master_orders/1.json
    def update
      respond_to do |format|
        if @master_order.update(master_order_params)
          format.html { redirect_to action: :show, notice: 'Master order was successfully updated.' }
          format.json { render :show, status: :ok, location: @master_order }
        else
          format.html { render :edit }
          format.json { render json: @master_order.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /master_orders/1
    # DELETE /master_orders/1.json
    def destroy
      @master_order.destroy
      respond_to do |format|
        format.html { redirect_to action: :index, notice: 'Master order was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_master_order
        @master_order = MasterOrder.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def master_order_params
        params.require(:master_order).permit(:year, :month,
                                            orders_attributes: [
                                            :id, :purchase, :distributor, :expire, :value, :payment, :_destroy])
      end
  end
end
