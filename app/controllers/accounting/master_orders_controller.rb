module Accounting
  class MasterOrdersController < ApplicationController
    before_action :set_master_order, only: [:show, :edit, :update, :destroy]
    before_action :set_options_for_select, only: [:new, :create, :update, :edit]

    # GET /master_orders
    # GET /master_orders.json
    def index
      @master_orders = MasterOrder.all.order('master_orders.created_at DESC')
      @master_orders = Kaminari.paginate_array(@master_orders).page(params[:page]).per(12)
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
          format.html { redirect_to accounting_master_order_path(@master_order), notice: "Pedidos e Pagamentos '#{l(@master_order.date, format: :short)}' foi criado com sucesso!" }
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
          format.html { redirect_to accounting_master_order_path(@master_order), notice: "Pedidos e Pagamentos '#{l(@master_order.date, format: :short)}' foi atualizado com sucesso!" }
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
        format.html { redirect_to accounting_master_orders_path, notice: "Pedidos e Pagamentos '#{l(@master_order.date, format: :short)}' foi excluído com sucesso!" }
        format.json { head :no_content }
      end
    end

    private

      def set_options_for_select
        @supplier_options_for_select = Supplier.all
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_master_order
        @master_order = MasterOrder.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def master_order_params
        params.require(:master_order).permit(:date,
                                            orders_attributes: [
                                            :id, :purchase, :supplier_id, :expire, :value, :payment, :_destroy])
      end
  end
end
