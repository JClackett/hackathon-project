class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @doctor = Doctor.where(user_id: current_user.id).first
    @posts = Post.where(doctor_id: @doctor.id).all
    @messages = Message.where(doctor_id: @doctor.id).all
    @doctor_messages = Message.where(created_by: @doctor.user_id).all
    @patients_messages = @messages - @doctor_messages
    @patients = Patient.where(doctor_id: @doctor.id).all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @patient = Patient.find(params[:patient_id])
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if current_user.doctor == true
      @post.doctor_id = Doctor.where(user_id: current_user.id).first.id
      @post.save
      redirect_to patient_path(@post.patient_id)
    else
      @post.doctor_id = Patient.where(user_id: current_user.id).first.doctor_id
      @post.save
      redirect_to patient_path(@post.patient_id)
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:patient_id, :location, :discomfort, :frequency, :initial_occurence, :notes)
    end
end
