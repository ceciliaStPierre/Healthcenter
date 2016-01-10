class PlansController < ApplicationController
  before_action :set_plan, only: [:show,:edit,  :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @family_group = FamilyGroup.find(params[:id])
    @plans = @family_group.plans
    @activity = Activity.new
    @plan = @plans.first
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    @family_group = FamilyGroup.find(params[:id])
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    @patient = Patient.find(params[:patient_selec]['id'])
    @family_group = FamilyGroup.find(params[:id])
    @plan.state = "Abierto"

    respond_to do |format|
      if @plan.save
        current_user.plans << @plan
        @family_group.plans << @plan
        @family_group.save
        format.html { redirect_to planslink_path(@family_group.id), notice: 'Plan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to planslink_path(@plan.family_group.id) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:owner_id, :family_summary, :clinical_objective, :risk_factor, :state, :plan_type, :close_reason, :close_datetime, :risk_details, :protection_details)
    end
end
