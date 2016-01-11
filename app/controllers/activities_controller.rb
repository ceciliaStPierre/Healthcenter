class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :plan_log, only: [:show]


  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @plan = Plan.find(params[:id])
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    respond_to do |format|
      if @activity.save
        #Guardamos todos los objectivos
        params[:objectives].split(",").each do |objective|
          puts objective
          obj = Objective.create(description: objective, is_done: false)
          @activity.objectives << obj
        end
        #Guardamos al usuario correspondiente
        params[:users].each do |user_id|
          ActivitiesUser.create(activity_id: @activity.id, user_id: user_id)
          
        end
        @plan = Plan.find(params[:plan_id])
        @plan.activities << @activity
        format.html { redirect_to planslink_path(@activity.plan.family_group.id), notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        for i in 0..@activity.objectives.length()-1
          objective = @activity.objectives[i]
          objective.is_done = params[:objective][i.to_s()]
          objective.save!
        end
        format.html { redirect_to planslink_path(@activity.plan.family_group.id), notice: '¡Actividad actualizada!.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @family_group = @activity.plan.family_group
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to planslink_path(@family_group.id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:description, :is_done, :observations, :activity_type, :deadline)
    end

    def plan_log
      Planlog.create([{ user_id: current_user.id, activity_id:params[:id] , timestamp: Time.now}]);
      
    end
end
