class IncomeTypesController < ApplicationController
  before_action :set_income_type, only: [:show, :edit, :update, :destroy]

  # GET /income_types
  # GET /income_types.json
  def index
    @income_types = IncomeType.all
  end

  # GET /income_types/1
  # GET /income_types/1.json
  def show
  end

  # GET /income_types/new
  def new
    @income_type = IncomeType.new
  end

  # GET /income_types/1/edit
  def edit
  end

  # POST /income_types
  # POST /income_types.json
  def create
    @income_type = IncomeType.new(income_type_params)

    respond_to do |format|
      if @income_type.save
        format.html { redirect_to @income_type, notice: 'Income type was successfully created.' }
        format.json { render :show, status: :created, location: @income_type }
      else
        format.html { render :new }
        format.json { render json: @income_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_types/1
  # PATCH/PUT /income_types/1.json
  def update
    respond_to do |format|
      if @income_type.update(income_type_params)
        format.html { redirect_to @income_type, notice: 'Income type was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_type }
      else
        format.html { render :edit }
        format.json { render json: @income_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_types/1
  # DELETE /income_types/1.json
  def destroy
    @income_type.destroy
    respond_to do |format|
      format.html { redirect_to income_types_url, notice: 'Income type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_type
      @income_type = IncomeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_type_params
      params.require(:income_type).permit(:name)
    end
end
