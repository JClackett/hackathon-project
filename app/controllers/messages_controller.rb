class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    if current_user.doctor == true
      @message.doctor_id = Doctor.where(user_id: current_user.id).first.id
      @message.patient_id = Patient.where(doctors_id: current_user.id).first.id
      @message.created_by = current_user.id
      @message.save
      redirect_to patient_path(@message.patient_id)
    else
      @message.patient_id = Patient.where(user_id: current_user.id).first.id
      @message.doctor_id = Patient.where(user_id: current_user.id).first.doctors_id
      @message.created_by = current_user.id
      @message.save
      redirect_to patient_path(@message.patient_id)
    end

  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:doctor_id, :patient_id, :content, :created_by)
    end
end
