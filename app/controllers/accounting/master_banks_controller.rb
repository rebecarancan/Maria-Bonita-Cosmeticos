module Accounting
  class MasterBanksController < ApplicationController
    before_action :set_master_bank, only: [:show, :edit, :update, :destroy]
    before_action :set_options_for_select, only: [:new, :create, :update, :edit]

    # GET /master_banks
    # GET /master_banks.json
    def index
      @master_banks = MasterBank.all.order('master_banks.created_at DESC')
      @master_banks = Kaminari.paginate_array(@master_banks).page(params[:page]).per(12)
    end

    # GET /master_banks/1
    # GET /master_banks/1.json
    def show
    end

    # GET /master_banks/new
    def new
      @master_bank = MasterBank.new
    end

    # GET /master_banks/1/edit
    def edit
    end

    # POST /master_banks
    # POST /master_banks.json
    def create
      @master_bank = MasterBank.new(master_bank_params)

      respond_to do |format|
        if @master_bank.save
          format.html { redirect_to accounting_master_bank_path(@master_bank), notice: "Controle Bancário '#{l(@master_bank.date, format: :short)}' foi criado com sucesso!" }
          format.json { render :show, status: :created, location: @master_bank }
        else
          format.html { render :new }
          format.json { render json: @master_bank.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /master_banks/1
    # PATCH/PUT /master_banks/1.json
    def update
      respond_to do |format|
        if @master_bank.update(master_bank_params)
          format.html { redirect_to accounting_master_bank_path(@master_bank), notice: "Controle Bancário '#{l(@master_bank.date, format: :short)}' foi atualizado com sucesso com sucesso!" }
          format.json { render :show, status: :ok, location: @master_bank }
        else
          format.html { render :edit }
          format.json { render json: @master_bank.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /master_banks/1
    # DELETE /master_banks/1.json
    def destroy
      @master_bank.destroy
      respond_to do |format|
        format.html { redirect_to accounting_master_banks_path, notice: "Controle Bancário '#{l(@master_bank.date, format: :short)}' foi excluído com sucesso com sucesso!" }
        format.json { head :no_content }
      end
    end

    private

      def set_options_for_select
        @expense_type_options_for_select = ExpenseType.all
        @income_type_options_for_select = IncomeType.all
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_master_bank
        @master_bank = MasterBank.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def master_bank_params
        params.require(:master_bank).permit(:date, :initial_balance, :final_balance,
                                            banks_attributes: [
                                            :id, :day, :description, :value,
                                            :expense_type_id, :income_type_id, :_destroy])
      end
  end
end
