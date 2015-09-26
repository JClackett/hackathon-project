class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)
    if current_user.doctor == true
      @result.doctor_id = Doctor.where(user_id: current_user.id).first.id
      @result.patient_id = Patient.where(doctors_id: current_user.id).first.id
      @result.save
      redirect_to patient_path(@result.patient_id)
    else
      @result.patient_id = Patient.where(user_id: current_user.id).first.id
      @result.doctor_id = Patient.where(user_id: current_user.id).first.doctors_id
      @result.save
      redirect_to patient_path(@result.patient_id)
    end
  end


  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:doctor_id, :patient_id, :status, :raw_data, :notes)
    end
end
