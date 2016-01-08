class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @label= "Registro"
  end

  # GET /users/1/edit
  def edit
    @label= "Editar"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    require 'securerandom'
    @password = SecureRandom.hex(8)

    @user.password = @password
    @user.password_confirmation=@password
    respond_to do |format|
      if @user.save
        UserMailer.welcome_notification(@user, @password).deliver
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = User.find_by_email(current_user.email).try(:authenticate, params[:current_password])
    respond_to do |format|
      if user && @user.update(user_params)
        format.html { redirect_to @user, notice: 'Perfil actualizado.' }
        format.json { head :no_content }
      else
        flash[:notice] = "Contraseña incorrecta"
        format.html { render action: 'edit', notice: 'Contraseña incorrecta.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def password_change
    set_user
  end

  def update_password
    @user = User.find(params[:id])
    respond_to do |format|
      user = User.find_by_email(current_user.email).try(:authenticate, params[:current_password])
      @user.updating_password = true
      if user &&  @user.update(:password => params[:password], :password_confirmation => params[:password_confirmation], :updating_password => false)
        format.html { redirect_to @user, notice: 'Perfil actualizado.' }
        format.json { head :no_content }
      elsif user
        flash[:notice] = "Las contraseña no coinciden"
        format.html { render action: 'password_change' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        flash[:notice] = "Contraseña actual incorrecta"
        format.html { render action: 'password_change' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def inbox
    @conversations = current_user.mailbox.inbox
  end

  def conversation
    @conversation = Conversation.find(params[:id])
  end

  def new_conversation

  end

  def send_message
    destinatary = User.find(params[:user]['id'])
    subject = params[:subject]
    body = params[:body]
    current_user.send_message(destinatary,body, subject)
    redirect_to inbox_path
  end

  def reply_message
    message = params[:content]
    conversation = Conversation.find(params[:conversation_id])
    current_user.reply_to_conversation(conversation,message)
    redirect_to :controller => 'users', :action => 'conversation', :id => conversation.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :secondname, :father_lastname, :mother_lastname, :phone_number, :speciality, :email, :password, :password_confirmation, :avatar, :updating_password, :program, :sector)
    end
end
