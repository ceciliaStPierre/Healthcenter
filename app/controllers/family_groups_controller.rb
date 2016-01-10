class FamilyGroupsController < ApplicationController
  before_action :set_family_group, only: [:show, :edit, :update, :destroy ,:add]

  # GET /family_groups
  # GET /family_groups.json
  def index
    @family_groups = FamilyGroup.all
  end

  # GET /family_groups/1
  # GET /family_groups/1.json
  def show
  end

  # GET /family_groups/new
  def new
    @family_group = FamilyGroup.new
  end

  # GET /family_groups/1/edit
  def edit
  end

  def add
  end

  def add_patient_to_group
    @family_group = FamilyGroup.find(params[:family_group])
    @patient = Patient.find(params[:patient]['id'])
    @family_groups_patient = FamilyGroupsPatient.create(family_group_id: @family_group.id, patient_id: @patient.id)
    redirect_to @family_group
  end

  #def remove_patient_from_group
    #@family_group = FamilyGroup.find(params[:family_group])
    #@patient = Patient.find(params[:patient])
   # @family_groups_patient = FamilyGroupsPatient.where({family_group_id: params[:family_group], patient_id: params[:patient]}).destroy_all

    #redirect_to @family_group
  #end

  # POST /family_groups
  # POST /family_groups.json
  def create
    @family_group = FamilyGroup.new(family_group_params)

    @patient = Patient.find(params[:patient_selec]['id'])
    respond_to do |format|
      if @family_group.save
        @family_groups_patient = FamilyGroupsPatient.create(family_group_id: @family_group.id, patient_id: @patient.id)
        @family_group.index_patient_id = @patient.id
        @family_group.family_name = @patient.father_lastname+"-"+@patient.mother_lastname+"-"+@family_group.family_name
        @family_group.save!
        format.html { redirect_to @family_group, notice: 'Family group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @family_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @family_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_groups/1
  # PATCH/PUT /family_groups/1.json
  def update
    respond_to do |format|
      if @family_group.update(family_group_params)
        format.html { redirect_to @family_group, notice: 'Family group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @family_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_groups/1
  # DELETE /family_groups/1.json
  def destroy
    @family_group.destroy
    respond_to do |format|
      format.html { redirect_to family_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_group
      @family_group = FamilyGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_group_params
      params.require(:family_group).permit(:family_name)
    end
end
