module Accounting
  class MasterFinancesController < ApplicationController
    before_action :set_master_finance, only: [:show, :edit, :update, :destroy]
    before_action :set_options_for_select, only: [:new, :create, :update, :edit]

    # GET /master_finances
    # GET /master_finances.json
    def index
      @master_finances = MasterFinance.all.order('master_finances.created_at DESC')
      @master_finances = Kaminari.paginate_array(@master_finances).page(params[:page]).per(12)
    end

    # GET /master_finances/1
    # GET /master_finances/1.json
    def show
    end

    # GET /master_finances/new
    def new
      @master_finance = MasterFinance.new
    end

    # GET /master_finances/1/edit
    def edit
    end

    # POST /master_finances
    # POST /master_finances.json
    def create
      @master_finance = MasterFinance.new(master_finance_params)

      respond_to do |format|
        if @master_finance.save
          format.html { redirect_to accounting_master_finance_path(@master_finance), notice: "Finanças Diárias '#{l(@master_finance.date, format: :short)}' foi criada com sucesso!" }
          format.json { render :show, status: :created, location: @master_finance }
        else
          format.html { render :new }
          format.json { render json: @master_finance.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /master_finances/1
    # PATCH/PUT /master_finances/1.json
    def update
      respond_to do |format|
        if @master_finance.update(master_finance_params)
          format.html { redirect_to accounting_master_finance_path(@master_finance), notice: "Finanças Diárias '#{l(@master_finance.date, format: :short)}' foi atualizada com sucesso!" }
          format.json { render :show, status: :ok, location: @master_finance }
        else
          format.html { render :edit }
          format.json { render json: @master_finance.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /master_finances/1
    # DELETE /master_finances/1.json
    def destroy
      @master_finance.destroy
      respond_to do |format|
        format.html { redirect_to accounting_master_finances_path, notice: "Finanças Diárias '#{l(@master_finance.date, format: :short)}' foi excluída com sucesso!" }
        format.json { head :no_content }
      end
    end

    private

      def set_options_for_select
        @expense_type_options_for_select = ExpenseType.all
        @income_type_options_for_select = IncomeType.all
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_master_finance
        @master_finance = MasterFinance.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def master_finance_params
        params.require(:master_finance).permit(:date, :balance,
                                        finances_attributes: [
                                        :id, :day, :description, :value, :expense_type_id,
                                        :income_type_id, :_destroy])
      end
  end
end
