module Accounting
  class MasterNotesController < ApplicationController
    before_action :set_master_note, only: [:show, :edit, :update, :destroy]

    # GET /master_notes
    # GET /master_notes.json
    def index
      @master_notes = MasterNote.all.order('master_notes.created_at DESC')
      @master_notes = Kaminari.paginate_array(@master_notes).page(params[:page]).per(12)
    end

    # GET /master_notes/1
    # GET /master_notes/1.json
    def show
    end

    # GET /master_notes/new
    def new
      @master_note = MasterNote.new
    end

    # GET /master_notes/1/edit
    def edit
    end

    # POST /master_notes
    # POST /master_notes.json
    def create
      @master_note = MasterNote.new(master_note_params)

      respond_to do |format|
        if @master_note.save
          format.html { redirect_to accounting_master_note_path(@master_note), notice: 'Master note was successfully created.' }
          format.json { render :show, status: :created, location: @master_note }
        else
          format.html { render :new }
          format.json { render json: @master_note.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /master_notes/1
    # PATCH/PUT /master_notes/1.json
    def update
      respond_to do |format|
        if @master_note.update(master_note_params)
          format.html { redirect_to action: :show, notice: 'Master note was successfully updated.' }
          format.json { render :show, status: :ok, location: @master_note }
        else
          format.html { render :edit }
          format.json { render json: @master_note.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /master_notes/1
    # DELETE /master_notes/1.json
    def destroy
      @master_note.destroy
      respond_to do |format|
        format.html { redirect_to action: :index, notice: 'Master note was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_master_note
        @master_note = MasterNote.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def master_note_params
        params.require(:master_note).permit(:year, :month,
                                            notes_attributes: [
                                            :id, :day, :name, :value, :_destroy])
      end
  end
end