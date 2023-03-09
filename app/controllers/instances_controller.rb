class InstancesController < ApplicationController
  before_action :set_instance, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /instances or /instances.json
  def index
    @instances = Instance.where(user_id: current_user.id)
  end

  # GET /instances/1 or /instances/1.json
  def show
  end

  def file
    #create new instance with attached file
    @instance = Instance.new()
    @instance.user_id = current_user.id
    @instance.files.attach(params[:file])
    @instance.save
  end

  # GET /instances/new
  def new
    @instance = Instance.new
  end

  # GET /instances/1/edit
  def edit
  end

  # POST /instances or /instances.json
  def create
    @instance = Instance.new(instance_params)

    respond_to do |format|
      if @instance.save
        format.html { redirect_to instance_url(@instance), notice: "Instance was successfully created." }
        format.json { render :show, status: :created, location: @instance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instances/1 or /instances/1.json
  def update
    respond_to do |format|
      if @instance.update(instance_params)
        format.html { redirect_to instance_url(@instance), notice: "Instance was successfully updated." }
        format.json { render :show, status: :ok, location: @instance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1 or /instances/1.json
  def destroy
    @instance.destroy

    respond_to do |format|
      format.html { redirect_to instances_url, notice: "Instance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instance_params
      params.require(:instance).permit(:name)
    end
end
