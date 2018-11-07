module Accounting
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    # GET /accounting/orders
    # GET /accounting/orders.json
    def index
      @orders = Order.all
    end

    # GET /accounting/orders/1
    # GET /accounting/orders/1.json
    def show
    end

    # GET /accounting/orders/new
    def new
      @order = Order.new
    end

    # GET /accounting/orders/1/edit
    def edit
    end

    # POST /accounting/orders
    # POST /accounting/orders.json
    def create
      @order = Order.new(order_params)

      respond_to do |format|
        if @order.save
          format.html { redirect_to action: :index, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /accounting/orders/1
    # PATCH/PUT /accounting/orders/1.json
    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /accounting/orders/1
    # DELETE /accounting/orders/1.json
    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def order_params
        params.require(:order).permit(:purchase, :distributor, :expire, :value_cents, :payment_id)
      end
  end
end
